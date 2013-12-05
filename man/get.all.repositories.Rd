\name{get.all.repositories}
\alias{get.all.repositories}
\title{get list of all repositories}
\usage{
  get.all.repositories(..., ctx = get.github.context())
}
\arguments{
  \item{...}{extra parameters, use "since=id" for
  pagination}

  \item{ctx}{the github context object}
}
\value{
  list of repositories
}
\description{
  get list of all repositories
}

