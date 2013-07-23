\name{search.issues}
\alias{search.issues}
\title{Search Github issues.}
\usage{
  search.issues(ctx, q, ...)
}
\arguments{
  \item{ctx}{Authentication object}

  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}
}
\description{
  Search Github issues.
}
\examples{
\dontrun{
search.issues(ctx, "windows label:bug language:python state:open", sort="created", order="asc")
}
}

