\name{add.issue.labels}
\alias{add.issue.labels}
\title{Add labels to an issue}
\usage{
  add.issue.labels(owner, repo, issue.number, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{issue.number}{the number of the issue}

  \item{content}{the list of labels}

  \item{ctx}{the github context object}
}
\value{
  The list of labels
}
\description{
  Add labels to an issue
}

