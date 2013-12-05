\name{get.user.performed.events}
\alias{get.user.performed.events}
\title{list events that a user has performed}
\usage{
  get.user.performed.events(user, ...,
    ctx = get.github.context())
}
\arguments{
  \item{user}{the user}

  \item{...}{extra parameters. See
  http://developer.github.com/v3/activity/events/ for
  details}

  \item{ctx}{the github context object}
}
\value{
  the list of events the user has performed. If user is the
  authenticated user, this includes private events.
  Otherwise, this list contains only public events.
}
\description{
  list events that a user has performed
}

