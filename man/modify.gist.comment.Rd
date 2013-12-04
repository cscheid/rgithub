\name{modify.gist.comment}
\alias{modify.gist.comment}
\title{Edit gist comment}
\usage{
  modify.gist.comment(gist.id, comment.id, content,
    config = add_headers(Accept = "application/vnd.github.v3.text+json"),
    ctx = get.github.context())
}
\arguments{
  \item{gist.id}{the gist id}

  \item{comment.id}{the comment id}

  \item{content}{the JSON object describing the comment.
  see
  http://developer.github.com/v3/gists/comments/#edit-a-comment
  for details}

  \item{ctx}{the github context object}
}
\value{
  the comment
}
\description{
  Edit gist comment
}

