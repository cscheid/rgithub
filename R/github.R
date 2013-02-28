require(httr)
require(RCurl)
require(stringr)

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
  list(app=app, token=github_token, sig=github_sig, api_url=api_url, base_url=base_url, client_secret=client_secret, client_id=client_id)
}

api.request <- function(ctx, req, method)
{
  path = str_c(req, collapse='/')
  url = modify_url(ctx$api_url, path=path, query=list(client_id=ctx$client_id, client_secret=ctx$client_secret))
  r=method(url, accept_json())
  stopifnot(r$status_code == 200)
  r$content = fromJSON(rawToChar(r$content))
  r
}

api.get.request <- function(ctx, req)
{
  api.request(ctx, req, GET)
}

api.put.request <- function(ctx, req)
{
  api.request(ctx, req, PUT)
}
