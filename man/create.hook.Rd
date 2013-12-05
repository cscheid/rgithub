\name{create.hook}
\alias{create.hook}
\title{create a new hook for repo}
\usage{
  create.hook(owner, repo, content,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{content}{the JSON object describing the hook. See
  http://developer.github.com/v3/repos/hooks/#create-a-hook
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the specific hook
}
\description{
  create a new hook for repo
}

