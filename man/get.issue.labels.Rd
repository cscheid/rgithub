\name{get.issue.labels}
\alias{get.issue.labels}
\title{List all labels for an issue}
\usage{
  get.issue.labels(owner, repo, issue.number,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{issue.number}{the number of the issue}

  \item{ctx}{the github context object}
}
\value{
  The list of labels
}
\description{
  List all labels for an issue
}

