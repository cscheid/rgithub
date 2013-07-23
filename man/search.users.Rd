\name{search.users}
\alias{search.users}
\title{Search Github users.}
\usage{
  search.users(ctx, q, ...)
}
\arguments{
  \item{ctx}{Authentication object}

  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}
}
\description{
  Search Github users.
}
\examples{
\dontrun{
search.users(ctx, "tom repos:>42 followers:>1000")
}
}

