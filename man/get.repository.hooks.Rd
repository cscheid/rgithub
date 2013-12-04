\name{get.repository.hooks}
\alias{get.repository.hooks}
\title{list hooks of repository}
\usage{
  get.repository.hooks(owner, repo,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{ctx}{the github context object}
}
\value{
  list of hooks
}
\description{
  list hooks of repository
}

