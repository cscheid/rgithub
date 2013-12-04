\name{get.repository.commit}
\alias{get.repository.commit}
\title{get a specific commit from a repo}
\usage{
  get.repository.commit(owner, repo, sha,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{sha}{the SHA of the commit}

  \item{ctx}{the github context object}
}
\value{
  the commit
}
\description{
  get a specific commit from a repo
}

