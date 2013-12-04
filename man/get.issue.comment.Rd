\name{get.issue.comment}
\alias{get.issue.comment}
\title{Get specific comment}
\usage{
  get.issue.comment(owner, repo, issue.number,
    comment.number, ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{issue.number}{the issue number}

  \item{comment.number}{the comment number}

  \item{ctx}{the github context object}
}
\value{
  the comment
}
\description{
  Get specific comment
}

