\name{get.pull.requests}
\alias{get.pull.requests}
\title{list all pull requests}
\usage{
  get.pull.requests(owner, repo, ...,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{...}{extra parameters. See
  http://developer.github.com/v3/pulls/#list-pull-requests
  for details}

  \item{ctx}{the github context object}
}
\value{
  the list of pull requests
}
\description{
  list all pull requests
}

