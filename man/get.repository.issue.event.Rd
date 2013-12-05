\name{get.repository.issue.event}
\alias{get.repository.issue.event}
\title{List a single events for a repository issue}
\usage{
  get.repository.issue.event(owner, repo, event.number,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{ctx}{the github context object}
}
\value{
  The chosen event
}
\description{
  List a single events for a repository issue
}

