\name{search.repositories}
\alias{search.repositories}
\title{Search Github repositories.}
\usage{
  search.repositories(ctx, q, ...)
}
\arguments{
  \item{ctx}{Authentication object}

  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}
}
\description{
  Search Github repositories.
}
\examples{
\dontrun{
search.repositories(ctx, "tetris language:assembly")
}
}

