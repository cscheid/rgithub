\name{create.repository.label}
\alias{create.repository.label}
\title{create a label for a repository}
\usage{
  create.repository.label(owner, repo, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{content}{the JSON object describing the label. See
  http://developer.github.com/v3/issues/labels/#create-a-label
  for details.}

  \item{ctx}{the github context object}
}
\value{
  The given label
}
\description{
  create a label for a repository
}

