\name{create.team}
\alias{create.team}
\title{create a team in an organization}
\usage{
  create.team(org, content, ctx = get.github.context())
}
\arguments{
  \item{org}{the organization name}

  \item{content}{the JSON object describing the team. See
  http://developer.github.com/v3/orgs/teams/#create-team
  for details.}

  \item{ctx}{the github context object}
}
\value{
  team information
}
\description{
  create a team in an organization
}

