\name{get.repository.issue.events}
\alias{get.repository.issue.events}
\title{list issue events for a given repo}
\usage{
  get.repository.issue.events(owner, repo,
    ctx = get.github.context())

  get.repository.issue.events(owner, repo,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{...}{extra parameters. See
  http://developer.github.com/v3/activity/events/ for
  details}

  \item{ctx}{the github context object}

  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{ctx}{the github context object}
}
\value{
  the list of repository issue events

  The event list
}
\description{
  list issue events for a given repo

  List all issue events for a repository
}

