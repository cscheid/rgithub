\name{get.pull.request.commits}
\alias{get.pull.request.commits}
\title{list commits for a pull request}
\usage{
  get.pull.request.commits(owner, repo, id,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{id}{the pull request id}

  \item{ctx}{the github context object}
}
\value{
  the list of pull request commits
}
\description{
  list commits for a pull request
}

