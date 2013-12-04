\name{delete.repository.download}
\alias{delete.repository.download}
\title{delete specific download for a repository}
\usage{
  delete.repository.download(owner, repo, id,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{id}{the id of the dowloand}

  \item{ctx}{the github context object}
}
\value{
  the specific downloads
}
\description{
  delete specific download for a repository
}

