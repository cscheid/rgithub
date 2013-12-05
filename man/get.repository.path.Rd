\name{get.repository.path}
\alias{get.repository.path}
\title{Get the contents of a file}
\usage{
  get.repository.path(owner, repo, path, ...,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{path}{the file path}

  \item{...}{extra parameters to be passed. See
  http://developer.github.com/v3/repos/contents/#get-contents}

  \item{ctx}{the github context object}
}
\value{
  the file
}
\description{
  Get the contents of a file
}

