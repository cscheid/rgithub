\name{get.repository.issue.events}
\alias{get.repository.issue.events}
\title{list issue events for a given repo}
\usage{
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
}
\value{
  the list of repository issue events
}
\description{
  list issue events for a given repo
}

