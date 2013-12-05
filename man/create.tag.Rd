\name{create.tag}
\alias{create.tag}
\title{create a tag}
\usage{
  create.tag(owner, repo, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the name of the repo}

  \item{content}{the JSON object describing the content.
  See
  http://developer.github.com/v3/git/tags/#create-a-tag-object
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the tag
}
\description{
  create a tag
}

