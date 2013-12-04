\name{delete.repository.key}
\alias{delete.repository.key}
\title{delete a repository key}
\usage{
  delete.repository.key(owner, repo, id,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{id}{the id of the key}

  \item{ctx}{the github context object}
}
\value{
  none
}
\description{
  delete a repository key
}

