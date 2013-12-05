\name{get.milestone}
\alias{get.milestone}
\title{Get specific milestone from a repository}
\usage{
  get.milestone(owner, repo, milestone.number,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{milestone.number}{the milestone number}

  \item{...}{other parameters. See
  http://developer.github.com/v3/issues/milestones/#list-milestones-for-a-repository
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the milestone list
}
\description{
  Get specific milestone from a repository
}

