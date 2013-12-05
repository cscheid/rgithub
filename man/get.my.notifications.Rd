\name{get.my.notifications}
\alias{get.my.notifications}
\title{list the current user's notifications}
\usage{
  get.my.notifications(..., ctx = get.github.context())
}
\arguments{
  \item{...}{extra parameters. See
  http://developer.github.com/v3/activity/notifications/#list-your-notifications
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the list of notifications
}
\description{
  list the current user's notifications
}

