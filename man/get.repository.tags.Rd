\name{get.repository.tags}
\alias{get.repository.tags}
\title{get list of repository tags}
\usage{
  get.repository.tags(owner, repo,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{ctx}{the github context object}
}
\value{
  list of tags
}
\description{
  get list of repository tags
}

