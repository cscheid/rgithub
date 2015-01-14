#' List all public organizations for an unauthenticated user. Lists private and public organizations for authenticated users.
#'
#' @param user the user
#'
#' @param ctx the githb context object
#'
#' @return the list of organizations
get.user.organizations <- function(user, ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "orgs"))

#' List all organizations for the current user.
#'
#' @param ctx the githb context object
#'
#' @return the list of organizations
get.my.organizations <- function(ctx = get.github.context())
  .api.get.request(ctx, c("user", "orgs"))

#' Get an organization
#'
#' @param org the organization name
#'
#' @param ctx the githb context object
#'
#' @return the organization information
get.organization <- function(org, ctx = get.github.context())
  .api.get.request(ctx, c("orgs", org))

#' modify an organization
#'
#' @param org the organization name
#'
#' @param content the JSON object describing the organization. See http://developer.github.com/v3/orgs/#edit-an-organization for details.
#'
#' @param ctx the github context object
#'
#' @return the organization information
modify.organization <- function(org, content, ctx = get.github.context())
  .api.patch.request(ctx, c("orgs", org), body=content)

################################################################################
# members

#' list all members from an organization. List all users who are members of an organization. A member is a user that belongs to at least 1 team in the organization. If the authenticated user is also an owner of this organization then both concealed and public members will be returned. If the requester is not an owner of the organization the query will be redirected to the public members list.
#'
#' @param org the organization name
#'
#' @param ctx the github context object
#'
#' @return the member list
get.organization.members <- function(org, ctx = get.github.context())
  .api.get.request(ctx, c("orgs", org, "members"))

#' test if user is a member of an organization
#'
#' @param org the organization name
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return TRUE if user is a member of organization
is.member.of.organization <- function(org, user, ctx = get.github.context())
  .api.test.request(ctx, c("orgs", org, "members", user))

#' delete user from an organization
#'
#' @param org the organization name
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return none
delete.member.from.organization <- function(org, user, ctx = get.github.context())
  .api.delete.request(ctx, c("orgs", org, "members", user))

#' list public members of organization
#'
#' @param org the organization name
#'
#' @param ctx the github context object
#'
#' @return the list of public members
get.organization.public.members <- function(org, ctx = get.github.context())
  .api.get.request(ctx, c("orgs", org, "public_members"))

#' test if user is a public member of organization
#'
#' @param org the organization name
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return TRUE if user is a public member of organization
is.public.member.of.organization <- function(org, user, ctx = get.github.context())
  .api.test.request(ctx, c("orgs", org, "public_members", user))

#' publicize user membership in an organization
#'
#' @param org the organization name
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return None
publicize.member.of.organization <- function(org, user, ctx = get.github.context())
  .api.put.request(ctx, c("orgs", org, "public_members", user), expect.code=204)

#' conceal user membership in an organization
#'
#' @param org the organization name
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return None
conceal.member.of.organization <- function(org, user, ctx = get.github.context())
  .api.delete.request(ctx, c("orgs", org, "public_members", user))

################################################################################
# teams

#' list teams from an organization
#'
#' @param org the organization name
#'
#' @param ctx the github context object
#'
#' @return the list of organization teams
get.organization.teams <- function(org, ctx = get.github.context())
  .api.get.request(ctx, c("orgs", org, "teams"))

#' get team information
#'
#' @param id the id of the team
#'
#' @param ctx the github context object
#'
#' @return team information
get.team <- function(id, ctx = get.github.context())
  .api.get.request(ctx, c("teams", id))

#' create a team in an organization
#'
#' @param org the organization name
#'
#' @param content the JSON object describing the team. See http://developer.github.com/v3/orgs/teams/#create-team for details.
#'
#' @param ctx the github context object
#'
#' @return team information
create.team <- function(org, content, ctx = get.github.context())
  .api.post.request(ctx, c("orgs", org, "teams"), body=content)

#' edit a team in an organization
#'
#' @param id team id
#'
#' @param content the JSON object describing the team. See http://developer.github.com/v3/orgs/teams/#create-team for details.
#'
#' @param ctx the github context object
#'
#' @return team information
modify.team <- function(id, content, ctx = get.github.context())
  .api.patch.request(ctx, c("teams", id), body=content)

#' delete a team in an organization
#'
#' @param id team id
#'
#' @param ctx the github context object
#'
#' @return none
delete.team <- function(id, ctx = get.github.context())
  .api.delete.request(ctx, c("teams", id))

#' list team members
#'
#' @param id team id
#'
#' @param ctx the github context object
#'
#' @return team member list
get.team.members <- function(id, ctx = get.github.context())
  .api.get.request(ctx, c("teams", id, "members"))

#' test if user is a member of team
#'
#' @param id team id
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return TRUE if user is member of team
is.member.in.team <- function(id, user, ctx = get.github.context())
  .api.test.request(ctx, c("teams", id, "members", user))

#' add member to team
#'
#' @param id team id
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return TRUE if user is member of team
add.member.to.team <- function(id, user, ctx = get.github.context())
  .api.put.request(ctx, c("teams", id, "memberships", user))

#' remove member from team
#'
#' @param id team id
#'
#' @param user the user name
#'
#' @param ctx the github context object
#'
#' @return none
delete.member.from.team <- function(id, user, ctx = get.github.context())
  .api.delete.request(ctx, c("teams", id, "members", user))

#' list repositories of a team
#'
#' @param id team id
#'
#' @param ctx the github context object
#'
#' @return the repository list
get.team.repositories <- function(id, ctx = get.github.context())
  .api.get.request(ctx, c("teams", id, "repos"))

#' add repository to team
#'
#' @param id team id
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param ctx the github context object
#'
#' @return none
add.repository.to.team <- function(id, owner, repo, ctx = get.github.context())
  .api.put.request(ctx, c("teams", id, "repos", owner, repo), expect.code=204)

#' remove repository from team
#'
#' @param id team id
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param ctx the github context object
#'
#' @return none
delete.repository.from.team <- function(id, owner, repo, ctx = get.github.context())
  .api.delete.request(ctx, c("teams", id, "repos", owner, repo))

