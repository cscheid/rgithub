\name{get.organization.public.events}
\alias{get.organization.public.events}
\title{list public events for an organization}
\usage{
  get.organization.public.events(org, ...,
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
  the list of events for the network of repositories
}
\description{
  list public events for an organization
}

