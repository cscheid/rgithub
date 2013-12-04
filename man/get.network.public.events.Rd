\name{get.network.public.events}
\alias{get.network.public.events}
\title{list events for a network of repositories}
\usage{
  get.network.public.events(owner, repo, ...,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{...}{extra parameters. See
  http://developer.github.com/v3/activity/events/ for
  details}

  \item{ctx}{the github context object}
}
\value{
  the list of events for the network of repositories
}
\description{
  list events for a network of repositories
}

