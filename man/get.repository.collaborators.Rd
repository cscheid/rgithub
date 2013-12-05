\name{get.repository.collaborators}
\alias{get.repository.collaborators}
\title{get list of collaborators of a repo}
\usage{
  get.repository.collaborators(owner, repo,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{ctx}{the github context object}
}
\value{
  list of collaborators
}
\description{
  get list of collaborators of a repo
}

