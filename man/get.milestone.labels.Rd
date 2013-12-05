\name{get.milestone.labels}
\alias{get.milestone.labels}
\title{Get labels for every issue in a milestone}
\usage{
  get.milestone.labels(owner, repo, milestone.number,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{milestone.number}{the number of the milestone}

  \item{ctx}{the github context object}
}
\value{
  All labels for that milestone
}
\description{
  Get labels for every issue in a milestone
}

