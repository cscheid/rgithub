\name{delete.repository.collaborator}
\alias{delete.repository.collaborator}
\title{delete a user from the list of collaborators of a repo}
\usage{
  delete.repository.collaborator(owner, repo, user,
    ctx = get.github.context())
}
\arguments{
  \item{owner}{the repo owner (user, org, etc)}

  \item{repo}{the name of the repo}

  \item{user}{the name of the user to delete}

  \item{ctx}{the github context object}
}
\value{
  none
}
\description{
  delete a user from the list of collaborators of a repo
}

