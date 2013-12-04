\name{get.all.my.issues}
\alias{get.all.my.issues}
\title{get all issues across all the authenticated user's visible repositories including owned repositories, member repositories, and organization repositories}
\usage{
  get.all.my.issues(..., ctx = get.github.context())
}
\arguments{
  \item{...}{extra parameters. See
  http://developer.github.com/v3/issues/ for details}

  \item{ctx}{the github context object}
}
\value{
  the list of issues
}
\description{
  get all issues across all the authenticated user's
  visible repositories including owned repositories, member
  repositories, and organization repositories
}

