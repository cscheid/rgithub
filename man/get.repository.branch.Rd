\name{get.repository.branch}
\alias{get.repository.branch}
\title{get specific repository branch}
\usage{
  get.repository.branch(owner, repo, branch,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{branch}{the name of the branch}

  \item{ctx}{the github context object}
}
\value{
  information about the branch
}
\description{
  get specific repository branch
}

