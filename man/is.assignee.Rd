\name{is.assignee}
\alias{is.assignee}
\title{Test if user is assignee in a repo}
\usage{
  is.assignee(owner, repo, assignee,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{assignee}{the user to check}

  \item{ctx}{the github context object}
}
\value{
  TRUE if user is assignee
}
\description{
  Test if user is assignee in a repo
}

