\name{get.organization.issues}
\alias{get.organization.issues}
\title{List all issues across an organization of the authenticated user:}
\usage{
  get.organization.issues(org, ...,
    ctx = get.github.context())
}
\arguments{
  \item{org}{the organization}

  \item{...}{extra parameters. See
  http://developer.github.com/v3/issues/ for details}

  \item{ctx}{the github context object}
}
\value{
  the list of issues
}
\description{
  List all issues across an organization of the
  authenticated user:
}

