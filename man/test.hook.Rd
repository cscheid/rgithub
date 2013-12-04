\name{test.hook}
\alias{test.hook}
\title{test a push hook. This will force github to trigger the given hook.}
\usage{
  test.hook(owner, repo, id, ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{id}{the id of the hook}

  \item{ctx}{the github context object}
}
\value{
  none
}
\description{
  test a push hook. This will force github to trigger the
  given hook.
}

