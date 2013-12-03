\name{search.issues}
\alias{search.issues}
\title{Search Github issues.}
\usage{
  search.issues(q, ..., ctx = get.github.context())
}
\arguments{
  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}

  \item{ctx}{Authentication object}
}
\description{
  Search Github issues.
}
\examples{
\dontrun{
search.issues("windows label:bug language:python state:open", sort="created", order="asc")
}
}

