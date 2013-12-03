\name{get.users}
\alias{get.users}
\title{Get all github users}
\usage{
  get.users(..., ctx = get.github.context())
}
\arguments{
  \item{...}{extra parameters. Use "since" for appropriate
  pagination}

  \item{ctx}{the github context object}
}
\value{
  A list of users
}
\description{
  Get all github users
}

