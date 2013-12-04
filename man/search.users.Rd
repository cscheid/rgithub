\name{search.users}
\alias{search.users}
\title{Search Github users.}
\usage{
  search.users(q, ..., ctx = get.github.context())
}
\arguments{
  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}

  \item{ctx}{Authentication object}
}
\description{
  Search Github users.
}
\examples{
\dontrun{
search.users("tom repos:>42 followers:>1000")
}
}

