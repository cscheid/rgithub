\name{get.tree}
\alias{get.tree}
\title{get a tree}
\usage{
  get.tree(owner, repo, sha, ...,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the name of the repo}

  \item{sha}{the SHA of the tree}

  \item{...}{extra parameters. if recursive=1, then
  directories are traversed recursively}

  \item{ctx}{the github context object}
}
\value{
  the tree contents
}
\description{
  get a tree
}

