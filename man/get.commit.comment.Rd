\name{get.commit.comment}
\alias{get.commit.comment}
\title{get a single commit comment}
\usage{
  get.commit.comment(owner, repo, id,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{id}{the comment id}

  \item{ctx}{the github context object}
}
\value{
  the comment
}
\description{
  get a single commit comment
}

