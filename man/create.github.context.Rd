\name{create.github.context}
\alias{create.github.context}
\title{Create a github context object.}
\usage{
  create.github.context(api_url = "https://api.github.com",
    client_id = NULL, client_secret = NULL,
    access_token = NULL, max_etags = 10000)
}
\arguments{
  \item{api_url}{the base URL}

  \item{client_id}{the github client ID}

  \item{client_secret}{the github client secret}

  \item{access_token}{the github access token}

  \item{max_etags}{the maximum number of entries to cache
  in the context}
}
\value{
  a github context object that is used in every github API
  call issued by this library.
}
\description{
  If create.github.context is called without some of
  client_id, client_secret or access_token, then some API
  calls will be unavailable, and more severe rate limiting
  will be in effect. Refer to http://developer.github.com
  for more details.
}
\details{
  create.github.context stores the context last created in
  an environment. If any of the github API functions are
  called without a context, this context is used instead.
  (if no context has been created, an unauthenticated
  context will be created)
}

