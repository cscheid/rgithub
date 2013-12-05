\name{get.repositories.starred.by.me}
\alias{get.repositories.starred.by.me}
\title{list repos starred by current user}
\usage{
  get.repositories.starred.by.me(...,
    ctx = get.github.context())
}
\arguments{
  \item{...}{extra parameters. See
  http://developer.github.com/v3/activity/starring/#list-repositories-being-starred
  for details.}

  \item{ctx}{the github context object}
}
\value{
  repo list
}
\description{
  list repos starred by current user
}

