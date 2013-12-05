\name{get.organization.members}
\alias{get.organization.members}
\title{list all members from an organization. List all users who are members of an organization. A member is a user that belongs to at least 1 team in the organization. If the authenticated user is also an owner of this organization then both concealed and public members will be returned. If the requester is not an owner of the organization the query will be redirected to the public members list.}
\usage{
  get.organization.members(org, ctx = get.github.context())
}
\arguments{
  \item{org}{the organization name}

  \item{ctx}{the github context object}
}
\value{
  the member list
}
\description{
  list all members from an organization. List all users who
  are members of an organization. A member is a user that
  belongs to at least 1 team in the organization. If the
  authenticated user is also an owner of this organization
  then both concealed and public members will be returned.
  If the requester is not an owner of the organization the
  query will be redirected to the public members list.
}

