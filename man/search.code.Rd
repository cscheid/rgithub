\name{search.code}
\alias{search.code}
\title{Search Github code.}
\usage{
  search.code(q, ..., ctx = get.github.context())
}
\arguments{
  \item{q}{Query string}

  \item{...}{Further arguments passed on to Github API
  call}

  \item{ctx}{Authentication object}
}
\description{
  Search Github code.
}
\examples{
\dontrun{
search.code("octokit in:file extension:gemspec -repo:octokit/octokit.rb", sort="indexed")
}
}

