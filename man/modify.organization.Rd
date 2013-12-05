\name{modify.organization}
\alias{modify.organization}
\title{modify an organization}
\usage{
  modify.organization(org, content,
    ctx = get.github.context())
}
\arguments{
  \item{org}{the organization name}

  \item{content}{the JSON object describing the
  organization. See
  http://developer.github.com/v3/orgs/#edit-an-organization
  for details.}

  \item{ctx}{the github context object}
}
\value{
  the organization information
}
\description{
  modify an organization
}

