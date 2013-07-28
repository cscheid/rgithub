\name{search.code}
\alias{search.code}
\title{Search Github code.}
\usage{
  search.code(ctx, q, ...)
}
\arguments{
  \item{ctx}{Authentication object}

  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}
}
\description{
  Search Github code.
}
\examples{
\dontrun{
search.code(ctx, "octokit in:file extension:gemspec -repo:octokit/octokit.rb", sort="indexed")
}
}

