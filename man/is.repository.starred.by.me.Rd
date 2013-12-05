\name{is.repository.starred.by.me}
\alias{is.repository.starred.by.me}
\title{check if repository is starred by current user}
\usage{
  is.repository.starred.by.me(owner, repo,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{repo owner}

  \item{repo}{name of repo}

  \item{ctx}{the github context object}
}
\value{
  TRUE if current user starred repo
}
\description{
  check if repository is starred by current user
}

