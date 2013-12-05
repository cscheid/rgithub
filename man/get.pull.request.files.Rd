\name{get.pull.request.files}
\alias{get.pull.request.files}
\title{list files for a pull request}
\usage{
  get.pull.request.files(owner, repo, id,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{id}{the pull request id}

  \item{ctx}{the github context object}
}
\value{
  the list of pull request files
}
\description{
  list files for a pull request
}

