\name{get.issue.comments}
\alias{get.issue.comments}
\title{Get list of comments for an issue}
\usage{
  get.issue.comments(owner, repo, number,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{number}{the issue number}

  \item{ctx}{the github context object}
}
\value{
  the list of comments
}
\description{
  Get list of comments for an issue
}

