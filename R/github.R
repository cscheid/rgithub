require(httr)
require(RCurl)
require(stringr)
require(rjson)

web.login <- function(client_id, client_secret=NULL,
                      base_url = "https://github.com", api_url = "https://api.github.com", scopes=NULL)
{
  auth_url <- NULL
  if (is.null(scopes))
    auth_url <- modify_url(base_url, path="login/oauth")
  else
    auth_url <- modify_url(base_url, path="login/oauth", query=list(scope=str_c(scopes, collapse=',')))
  github <- oauth_endpoint(NULL, "authorize", "access_token",
                           base_url = auth_url)
  # as in httr, if client_secret is not given,
  # the environment variable GITHUB_CONSUMER_SECRET will be
  # used.
  app <- oauth_app("github", client_id, client_secret)
  client_secret <- app$secret
  github_token <- oauth2.0_token(github, app)
  rgithub.context.from.token(api_url, client_id, client_secret, github_token)
}

# use this if you somehow already have obtained the access token
rgithub.context.from.token <- function(url, client_id, client_secret, access_token)
{
  ctx <- list(token=access_token, api_url=url, client_secret=client_secret, token=access_token, client_id=client_id, etags=new.env(parent=emptyenv()))
  r <- get.myself(ctx)
  if(r$ok) {
    ctx$user <- r$content
    list(ok = TRUE, content = ctx)
  }
  else list(ok = FALSE, content = content(r$response))
}

build.url <- function(ctx, req, params)
{
  # FIXME this path needs sanitization (some names can't include slashes, etc)
  # NB if you ever fix this, the *.reference calls in data.R will need attention, since reference include slashes that are passed unescaped to the github API

  path = str_c(req, collapse='/')

  query <- params
  query$client_id <- ctx$client_id
  query$client_secret <- ctx$client_secret
  query$access_token <- ctx$token[[1]]

  ## we cannot use modify_url directly, becasue it doesn't merge paths
  ## so we have to do that by hand
  api.path <- parse_url(ctx$api_url)$path
  if (isTRUE(nzchar(api.path)))
    path <- gsub('//+', '/', paste(api.path, path, sep='/'))

  modify_url(ctx$api_url, path=path, query=query)
}

api.request <- function(ctx, req, method, expect.code=200, params=list(), config=accept_json())
{
  url <- build.url(ctx, req, params)
  #fix for http://developer.github.com/changes/2013-04-24-user-agent-required/
  config<-c(config, user_agent(getOption("HTTPUserAgent")))
  r <- method(url, config=config)
  result <-  tryCatch(content(r),
                      error=function(e) {
                        raw <- r$content
                        raw[raw>127] = as.raw(63)
                        r$content <- raw
                        content(r)
                      })
  list(ok = r$status_code %in% expect.code, content = result, code = r$status_code)
}

# body can either be a json object (an R list of the right type), a length-1 character, or NULL
api.request.with.body <- function(ctx, req, method, expect.code=200, params=list(), config=accept_json(), body=NULL)
{
  if (is.list(body))
    body=toJSON(body)
  else if (is.character(body))
    stopifnot(length(body) == 1)
  else
    stopifnot(is.null(body))
  url <- build.url(ctx, req, params)
  #fix for http://developer.github.com/changes/2013-04-24-user-agent-required/
  config<-c(config, user_agent(getOption("HTTPUserAgent")))
  r = method(url, config=config, body=body)
  list(ok = r$status_code %in% expect.code, content = content(r), code = r$status_code);
}

api.get.request    <- function(ctx, req, expect.code=200, params=list(), config=accept_json()) api.request(ctx, req, GET, expect.code, params, config)
api.delete.request <- function(ctx, req, expect.code=204, params=list(), config=accept_json()) api.request(ctx, req, DELETE, expect.code, params, config)
api.put.request    <- function(ctx, req, expect.code=200, params=list(), config=accept_json(), body=NULL) api.request.with.body(ctx, req, PUT, expect.code, params, config, body)
api.patch.request  <- function(ctx, req, expect.code=200, params=list(), config=accept_json(), body=NULL) api.request.with.body(ctx, req, PATCH, expect.code, params, config, body)
api.post.request   <- function(ctx, req, expect.code=201, params=list(), config=accept_json(), body=NULL) api.request.with.body(ctx, req, POST, expect.code, params, config, body)

api.test.request <- function(ctx, path)
{
  r=api.get.request(ctx, path, expect.code=c(204, 404))

  if(r$ok)
    list(ok = TRUE, content = r$code == 204)
  else
    list(ok = FALSE, content = content(r$response))
}
