\name{search.repositories}
\alias{search.repositories}
\title{Search Github repositories.}
\usage{
  search.repositories(q, ..., ctx)
}
\arguments{
  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}

  \item{ctx}{Authentication object}
}
\description{
  Search Github repositories.
}
\examples{
\dontrun{
search.repositories("tetris language:assembly")
}
}

