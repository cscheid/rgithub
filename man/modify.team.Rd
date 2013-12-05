\name{modify.team}
\alias{modify.team}
\title{edit a team in an organization}
\usage{
  modify.team(id, content, ctx = get.github.context())
}
\arguments{
  \item{id}{team id}

  \item{content}{the JSON object describing the team. See
  http://developer.github.com/v3/orgs/teams/#create-team
  for details.}

  \item{ctx}{the github context object}
}
\value{
  team information
}
\description{
  edit a team in an organization
}

