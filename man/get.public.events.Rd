\name{get.public.events}
\alias{get.public.events}
\title{list public events}
\usage{
  get.public.events(..., ctx = get.github.context())
}
\arguments{
  \item{...}{the pagination parameters. See
  http://developer.github.com/v3/activity/events/ for
  details}

  \item{ctx}{the github context object}
}
\value{
  the list of public events
}
\description{
  list public events
}

