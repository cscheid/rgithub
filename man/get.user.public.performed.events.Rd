\name{get.user.public.performed.events}
\alias{get.user.public.performed.events}
\title{list public events that a user has performed}
\usage{
  get.user.public.performed.events(user, ...,
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
  the list of public events the user has performed.
}
\description{
  list public events that a user has performed
}

