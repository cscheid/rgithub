\name{interactive.login}
\alias{interactive.login}
\title{Obtain a github context interactively}
\usage{
  interactive.login(client_id, client_secret,
    scopes = NULL, base_url = "https://github.com",
    api_url = "https://api.github.com", max_etags = 10000)
}
\arguments{
  \item{client_id}{the github client ID}

  \item{client_secret}{the github client secret}

  \item{base_url}{the base URL for the github webpage.
  Change this in GitHub Enterprise deployments to your base
  G.E. URL}

  \item{api_url}{the base URL for the github API. Change
  this in GitHub Enterprise deployments to your base G.E.
  API URL}

  \item{max_etags}{the maximum number of entries to cache
  in the context}
}
\value{
  a github context object that is used in every github API
  call issued by this library.
}
\description{
  interactive.login opens a web browser, asks for your
  username+password, performs the OAuth dance, retrieves
  the token, and uses it to create a github context.
}
\details{
  Refer to
  http://developer.github.com/guides/basics-of-authentication/
}

