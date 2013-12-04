\name{create.gist.comment}
\alias{create.gist.comment}
\title{Create gist comment}
\usage{
  create.gist.comment(gist.id, content,
    config = add_headers(Accept = "application/vnd.github.v3.text+json"),
    ctx = get.github.context())
}
\arguments{
  \item{gist.id}{the gist id}

  \item{content}{the JSON object describing the comment.
  see
  http://developer.github.com/v3/gists/comments/#create-a-comment
  for details}

  \item{ctx}{the github context object}
}
\value{
  the comment
}
\description{
  Create gist comment
}

