\name{get.repository.statuses}
\alias{get.repository.statuses}
\title{get statuses for a ref in a repo}
\usage{
  get.repository.statuses(owner, repo, ref,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{ref}{Ref to list the statuses from. It can be a
  SHA, a branch name, or a tag name.}

  \item{ctx}{the github context object}
}
\value{
  the list of statuses
}
\description{
  get statuses for a ref in a repo
}

