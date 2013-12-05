\name{create.blob}
\alias{create.blob}
\title{create a blob}
\usage{
  create.blob(owner, repo, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the name of the repo}

  \item{content}{the JSON object describing the blob. See
  http://developer.github.com/v3/git/blobs/#create-a-blob
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the blob
}
\description{
  create a blob
}

