\name{modify.pull.request}
\alias{modify.pull.request}
\title{edit pull request}
\usage{
  modify.pull.request(owner, repo, id, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{id}{the pull request id}

  \item{content}{the JSON object representing the pull
  request. See
  http://developer.github.com/v3/pulls/#update-a-pull-request
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the specific pull request
}
\description{
  edit pull request
}

