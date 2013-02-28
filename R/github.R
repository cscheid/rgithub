require(httr)
require(RCurl)
require(stringr)
require(rjson)

web.login <- function(client_id, client_secret=NULL,
                      base_url = "https://github.com")
{
  github <- oauth_endpoint(NULL, "authorize", "access_token",
                           base_url = modify_url(base_url, path="login/oauth"))
  # as in httr, if client_secret is not given,
  # the environment variable GITHUB_CONSUMER_SECRET will be
  # used.
  app <- oauth_app("github", client_id, client_secret)
  github_token <- oauth2.0_token(github, app)
  github_sig <- sign_oauth2.0(github_token$access_token)
  api_url <- modify_url(base_url, hostname=str_c("api.", parse_url(base_url)$hostname))
  ctx <- list(app=app, token=github_token, sig=github_sig, api_url=api_url, base_url=base_url, client_secret=client_secret, client_id=client_id, etags=new.env(parent=emptyenv()))
  ctx$user <- user(ctx)
  ctx
}

api.request <- function(ctx, req, method, expect_code=200)
{
  # FIXME this path needs sanitization (names can't include slashes, etc)
  
  path = str_c(req, collapse='/')
  url = modify_url(ctx$api_url, path=path,
    query=list(client_id=ctx$client_id, client_secret=ctx$client_secret, access_token=ctx$token[[1]]))
  r=method(url, accept_json())
}

api.get.request <- function(ctx, req, expect_code=200) api.request(ctx, req, GET, expect_code)
api.put.request <- function(ctx, req, expect_code) api.request(ctx, req, PUT, expect_code)
api.delete.request <- function(ctx, req, expect_code) api.request(ctx, req, DELETE, expect_code)

