\name{create.tree}
\alias{create.tree}
\title{get a tree}
\usage{
  create.tree(owner, repo, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the name of the repo}

  \item{content}{the JSON object describing the tree. See
  http://developer.github.com/v3/git/trees/#create-a-tree
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the tree contents
}
\description{
  get a tree
}

