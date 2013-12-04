\name{create.repository}
\alias{create.repository}
\title{create repository}
\usage{
  create.repository(..., ctx = get.github.context())
}
\arguments{
  \item{...}{parameters, "name=repo_name" is required, see
  http://developer.github.com/v3/repos/#create for more}

  \item{ctx}{the github context object}
}
\value{
  the created repository
}
\description{
  create repository
}

