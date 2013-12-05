\name{get.pull.requests.comments}
\alias{get.pull.requests.comments}
\title{List comments on all pull requests for a repo}
\usage{
  get.pull.requests.comments(owner, repo, ...,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner}

  \item{repo}{the repo name}

  \item{...}{extra parameters to control pagination. See
  http://developer.github.com/v3/pulls/comments/#list-comments-in-a-repository
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the list of comments for the pull request
}
\description{
  List comments on all pull requests for a repo
}

