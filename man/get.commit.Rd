\name{get.commit}
\alias{get.commit}
\title{get a commit}
\usage{
  get.commit(owner, repo, sha, ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the name of the repo}

  \item{sha}{the SHA of the blob}

  \item{ctx}{the github context object}
}
\value{
  the commit
}
\description{
  get a commit
}

