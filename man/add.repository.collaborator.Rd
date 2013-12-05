\name{add.repository.collaborator}
\alias{add.repository.collaborator}
\title{add a user to the list of collaborators of a repo}
\usage{
  add.repository.collaborator(owner, repo, user,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{user}{the name of the user to add}

  \item{ctx}{the github context object}
}
\value{
  none
}
\description{
  add a user to the list of collaborators of a repo
}

