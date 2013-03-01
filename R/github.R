require(httr)
require(RCurl)
require(stringr)
require(rjson)

web.login <- function(client_id, client_secret=NULL,
                      base_url = "https://github.com", scopes=NULL)
{
  auth_url <- NULL
  if (is.null(scopes))
    auth_url <- modify_url(base_url, path="login/oauth")
  else
    auth_url <- modify_url(base_url, path="login/oauth", query=list(scope=str_c(scopes, collapse=',')))
  cat(str_c(auth_url, "\n"))
  github <- oauth_endpoint(NULL, "authorize", "access_token",
                           base_url = auth_url)
  # as in httr, if client_secret is not given,
  # the environment variable GITHUB_CONSUMER_SECRET will be
  # used.
  app <- oauth_app("github", client_id, client_secret)
  github_token <- oauth2.0_token(github, app)
  github_sig <- sign_oauth2.0(github_token$access_token)
  api_url <- modify_url(base_url, hostname=str_c("api.", parse_url(base_url)$hostname))
  ctx <- list(app=app, token=github_token, sig=github_sig, api_url=api_url, base_url=base_url, client_secret=client_secret, client_id=client_id, etags=new.env(parent=emptyenv()))
  ctx$user <- get.myself(ctx)
  ctx
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
  
  modify_url(ctx$api_url, path=path, query=query)
}

api.request <- function(ctx, req, method, expect.code=200, params=list(), config=accept_json())
{
  url <- build.url(ctx, req, params)
  r <- method(url, config=config)
  stopifnot(r$status_code %in% expect.code)
  r
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
  cat(url)
  cat(body)
  
  r = method(url, config=config, body=body)
  ## stopifnot(r$status_code %in% expect.code)
  r
}

api.get.request    <- function(ctx, req, expect.code=200, params=list(), config=accept_json()) api.request(ctx, req, GET, expect.code, params, config)
api.delete.request <- function(ctx, req, expect.code=204, params=list(), config=accept_json()) api.request(ctx, req, DELETE, expect.code, params, config)
api.put.request    <- function(ctx, req, expect.code=200, params=list(), config=accept_json(), body=NULL) api.request.with.body(ctx, req, PUT, expect.code, params, config, body)
api.patch.request  <- function(ctx, req, expect.code=200, params=list(), config=accept_json(), body=NULL) api.request.with.body(ctx, req, PATCH, expect.code, params, config, body)
api.post.request   <- function(ctx, req, expect.code=201, params=list(), config=accept_json(), body=NULL) api.request.with.body(ctx, req, POST, expect.code, params, config, body)
