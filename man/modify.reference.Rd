\name{modify.reference}
\alias{modify.reference}
\title{edit a reference}
\usage{
  modify.reference(owner, repo, ref, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the name of the repo}

  \item{ref}{the reference}

  \item{content}{the JSON object describing the reference.
  See
  http://developer.github.com/v3/git/refs/#update-a-reference
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the created reference
}
\description{
  edit a reference
}

