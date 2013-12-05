\name{get.my.organization.events}
\alias{get.my.organization.events}
\title{list events from the authenticated user organization}
\usage{
  get.my.organization.events(org, ...,
    ctx = get.github.context())
}
\arguments{
  \item{org}{the organization}

  \item{...}{extra parameters. See
  http://developer.github.com/v3/activity/events/ for
  details}

  \item{ctx}{the github context object}
}
\value{
  the list of events
}
\description{
  list events from the authenticated user organization
}

