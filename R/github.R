#' @title github-package: use the Github API from R
#' 
#' @description This package wraps the Github web service API so you can make R
#'   calls against the Github API (to get information about repositories, or
#'   even to create new content)
#'   
#' @author Carlos Scheidegger
#' @docType package
#' @name github
#' @aliases github
#' @keywords package github-package
#' @examples
#' \dontrun{get.user.repositories("cscheid")}
#' @seealso \code{jsonlite}
NULL 

.state <- new.env(parent=emptyenv())

#' Obtain a github context interactively
#' 
#' interactive.login opens a web browser, asks for your username+password,
#' performs the OAuth dance, retrieves the token, and uses it to create a github
#' context.
#' 
#' Refer to http://developer.github.com/guides/basics-of-authentication/
#' 
#' @param client_id the github client ID
#'   
#' @param client_secret the github client secret
#'   
#' @param scopes the OAuth scopes you want to request
#'   
#' @param base_url the base URL for the github webpage. Change this in GitHub
#'   Enterprise deployments to your base G.E. URL
#'   
#' @param api_url the base URL for the github API. Change this in GitHub
#'   Enterprise deployments to your base G.E. API URL
#'   
#' @param max_etags the maximum number of entries to cache in the context
#'   
#' @param verbose logical, passed to \code{create.github.context} and,
#'   ultimately, to httr configuration
#'   
#' @return a github context object that is used in every github API call issued
#'   by this library.
interactive.login <- function(client_id,
                              client_secret,
                              scopes = NULL,
                              base_url = "https://github.com",
                              api_url = "https://api.github.com",
                              max_etags = 10000,
                              verbose = FALSE)
{
  ## auth_url <- NULL
  auth_url <- modify_url(base_url, path = "login/oauth")
  ## if (is.null(scopes))
  ## else
  ##   auth_url <- modify_url(base_url, path = "login/oauth",
  ##                          query = list(scope = str_c(scopes, collapse = ',')))
  ## print(auth_url)
  github <- oauth_endpoint(NULL, "authorize", "access_token",
                           base_url = auth_url)
  # as in httr, if client_secret is not given,
  # the environment variable GITHUB_CONSUMER_SECRET will be
  # used.
  app <- oauth_app("github", client_id, client_secret)
  client_secret <- app$secret
  github_token <- oauth2.0_token(github, app, as_header=FALSE, scope=scopes)
  create.github.context(api_url, client_id, client_secret, github_token, verbose=verbose)
}

#' Create a github context object.
#'
#' If create.github.context is called without some of client_id, client_secret
#' or access_token, then some API calls will be unavailable, and more severe
#' rate limiting will be in effect. Refer to http://developer.github.com for
#' more details.
#'
#' create.github.context stores the context last created in an environment.
#' If any of the github API functions are called without a context, this
#' context is used instead. (if no context has been created, an unauthenticated
#' context will be created)
#'
#' @param api_url the base URL
#'
#' @param client_id the github client ID
#'
#' @param client_secret the github client secret
#'
#' @param access_token the github access token
#'
#' @param personal_token the personal access token given by github via the /authorizations api
#'
#' @param max_etags the maximum number of entries to cache in the context
#'
#' @param verbose if TRUE, passes verbose() to httr configuration
#'
#' @return a github context object that is used in every github API call
#'   issued by this library.
create.github.context <- function(api_url = "https://api.github.com", client_id = NULL,
                                  client_secret = NULL, access_token = NULL, personal_token = NULL,
                                  max_etags = 10000, verbose = FALSE)
{
  ctx <- list(api_url        = api_url,
              client_secret  = client_secret,
              personal_token = personal_token,
              token          = access_token,
              client_id      = client_id,
              max_etags      = max_etags,
              etags          = new.env(parent = emptyenv()),
              authenticated  = !is.null(access_token),
              verbose        = verbose)
  if (!is.null(access_token) || !is.null(personal_token)) {
    r <- get.myself(ctx)
    if (!r$ok) {
      if (!is.null(access_token))
        stop("invalid access_token.")
      if (!is.null(personal_token))
        stop("invalid (perhaps revoked?) personal_token.")
      stop("internal error, shouldn't have gotten here")
    }
    ctx$user <- r$content
    ctx$oath_scopes <- r$headers$`x-oauth-scopes`
  }
  class(ctx) <- "githubcontext"
  .state$ctx <- ctx
  ctx
}

#' returns the most recently created github context, or creates one if none has been so far created
#'
#' @return a github context object
get.github.context <- function()
{
  if (is.null(.state$ctx))
    create.github.context()
  .state$ctx
}

.build.url <- function(ctx, resource, params)
{
  # FIXME this path needs sanitization (some names can't include
  # slashes, etc) NB if you ever fix this, the *.reference calls in
  # data.R will need attention, since reference include slashes that
  # are passed unescaped to the github API

  query <- params
  if (!is.null(ctx$client_id))
    query$client_id <- ctx$client_id
  if (!is.null(ctx$client_secret))
    query$client_secret <- ctx$client_secret

  # we cannot use modify_url directly, because it doesn't merge paths
  # so we have to do that by hand
  api.path <- parse_url(ctx$api_url)$path
  if (isTRUE(nzchar(api.path)))
    path <- gsub('//+', '/', paste(api.path, resource, sep = '/'))
  else
    path <- resource

  if (is.null(ctx$token) && is.null(ctx$personal_token))
    return(list(url = modify_url(ctx$api_url, path = path, query = query),
                config = c()))

  if (!is.null(ctx$personal_token))
    return(list(url = modify_url(ctx$api_url, path = path, query = query),
                config = authenticate(ctx$personal_token, "x-oauth-basic", type = "basic")))

  # from here on out, ctx$token is not null

  # FIXME this is ugly: we use httr's refclass for the interactive flow, but a string for the non-interactive flow...
  if (!is.null(tryCatch(ctx$token$sign, error=function(cond) { NULL }))) {
    # we have sign: this came from the interactive flow...
    result <- modify_url(ctx$api_url, path = path, query = query)
    result <- ctx$token$sign(url = result)
    result <- result$url
    return(list(url = result, config = c()))
  } else {
    # we don't have sign: this came from the non-interactive flow.
    query$access_token <- ctx$token
    result <- modify_url(ctx$api_url, path = path, query = query)
    return(list(url = result, config = c()))
  }
}

.cached.api.request <- function(ctx, req, method, expect.code = 200,
                               params = list(), config = accept_json())
{
  resource <- str_c(req, collapse = '/')
  etags <- ctx$etags
  if (exists(resource, etags)) {
    cache <- get(resource, etags)
    tag <- cache$tag
    r <- .api.request(ctx, req, method, expect.code = c(304, expect.code),
                      params = params, config = c(add_headers(`If-None-Match`=tag), config))
    if (r$code == 304) {
      r$content <- cache$content
    }
  } else {
    r <- .api.request(ctx, req, method, expect.code = expect.code,
                      params = params, config = config)
  }
  if (r$code != 304) {
    assign(resource, list(tag = r$headers$ETag, content = r$content), etags)
  }

  # if etags environment is too large, we need to trim it.  but this
  # requires a traversal over the entire data structure, which is O(n)
  # so we only want this to happen once every O(n) operations to get
  # O(1) amortized time, and so we need to trim a constant fraction of
  # the elements at once. we get rid of half of them.
  #
  # We choose the entries to trim randomly.
  if (length(etags) > ctx$max_etags) {
    l <- as.list(etags)
    names_to_remove <- names(sample(as.list(etags), as.integer(length(etags)/2)))
    print(names_to_remove)
    print(names(as.list(etags)))
    rm(list=names_to_remove, envir=etags)
  }
  r
}

.api.request <- function(ctx, req, method, expect.code = 200,
                         params = list(), config = accept_json(), body = NULL)
{
  resource <- str_c(req, collapse = '/')
  lst <- .build.url(ctx, resource, params)
  url <- lst$url
  config <- c(config, lst$config)
  config <- c(config, user_agent(getOption("HTTPUserAgent")), add_headers(Accept = "application/vnd.github.beta+json"))
  if (ctx$verbose)
    config <- c(config, verbose())

  r <- method(url = url, config = config, body = body)
  result <- tryCatch(content(r),
                     error = function(e) {
                       raw <- r$content
                       raw[raw>127] <- as.raw(63)
                       r$content <- raw
                       content(r)
                     })
  output <-
  list(ok = r$status_code %in% expect.code, content = result, headers = r$headers,
       code = r$status_code)
  ## class(output) <- "github"
  output
}

.without.body <- function(method)
{
  function(url, config, body) { method(url, config = config) }
}

.with.body <- function(method) {
  function(url, config, body) {
    if (is.list(body)) {
      body <- toJSON(body, auto_unbox=TRUE, null="null")
      # config = c(config, add_headers(`Content-Type` = "application/json; charset=utf-8"))
    }
    else if (is.character(body))
      stopifnot(length(body) == 1)
    else
      stopifnot(is.null(body))
    method(url, config = config, body = body)
  }
}

.api.get.request    <- function(ctx, req, expect.code = 200, params = list(), config = accept_json())       .cached.api.request(ctx, req, .without.body(GET),    expect.code, params, config)
.api.delete.request <- function(ctx, req, expect.code = 204, params = list(), config = accept_json())              .api.request(ctx, req, .without.body(DELETE), expect.code, params, config)
.api.put.request    <- function(ctx, req, expect.code = 200, params = list(), config = accept_json(), body = NULL) .api.request(ctx, req, .with.body(PUT),       expect.code, params, config, body)
.api.patch.request  <- function(ctx, req, expect.code = 200, params = list(), config = accept_json(), body = NULL) .api.request(ctx, req, .with.body(PATCH),     expect.code, params, config, body)
.api.post.request   <- function(ctx, req, expect.code = 201, params = list(), config = accept_json(), body = NULL) .api.request(ctx, req, .with.body(POST),      expect.code, params, config, body)

.api.test.request <- function(ctx, path)
{
  r=.api.get.request(ctx, path, expect.code = c(204, 404))

  if(r$ok)
    list(ok = TRUE, content = r$code == 204)
  else
    list(ok = FALSE, content = content(r$response))
}
