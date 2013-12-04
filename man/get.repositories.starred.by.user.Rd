\name{get.repositories.starred.by.user}
\alias{get.repositories.starred.by.user}
\title{list repos starred by user}
\usage{
  get.repositories.starred.by.user(user, ...,
    ctx = get.github.context())
}
\arguments{
  \item{user}{name of user}

  \item{...}{extra parameters. See
  http://developer.github.com/v3/activity/starring/#list-repositories-being-starred
  for details.}

  \item{ctx}{the github context object}
}
\value{
  repo list
}
\description{
  list repos starred by user
}

