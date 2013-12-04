\name{create.commit.comment}
\alias{create.commit.comment}
\title{create a comment for a given commit in a repository}
\usage{
  create.commit.comment(owner, repo, sha, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{sha}{the SHA hash of the commit}

  \item{content}{JSON object describing the comment (see
  http://developer.github.com/v3/repos/comments/#create-a-commit-comment
  for details)}

  \item{ctx}{the github context object}
}
\value{
  the comment
}
\description{
  create a comment for a given commit in a repository
}

