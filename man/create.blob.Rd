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

  \item{sha}{the SHA of the blob}

  \item{ctx}{the github context object}
}
\value{
  the blob
}
\description{
  create a blob
}

