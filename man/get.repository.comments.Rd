\name{get.repository.comments}
\alias{get.repository.comments}
\title{get all commit comments for a repository}
\usage{
  get.repository.comments(owner, repo,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{ctx}{the github context object}
}
\value{
  list of comments
}
\description{
  get all commit comments for a repository
}

