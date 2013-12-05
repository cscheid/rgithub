\name{modify.pull.request.comment}
\alias{modify.pull.request.comment}
\title{Modify a comment on a pull request}
\usage{
  modify.pull.request.comment(owner, repo, pull.id,
    content, ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{pull.id}{the id of the pull request}

  \item{content}{the JSON object describing the edited
  content. See
  http://developer.github.com/v3/pulls/comments/#edit-a-comment
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the comment
}
\description{
  Modify a comment on a pull request
}

