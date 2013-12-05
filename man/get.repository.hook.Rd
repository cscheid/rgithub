\name{get.repository.hook}
\alias{get.repository.hook}
\title{get specific hook of repository}
\usage{
  get.repository.hook(owner, repo, id,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{id}{the id of the hook}

  \item{ctx}{the github context object}
}
\value{
  the specific hook
}
\description{
  get specific hook of repository
}

