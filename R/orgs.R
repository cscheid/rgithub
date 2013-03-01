get.user.organizations <- function(ctx, user)         api.get.request(ctx, c("users", user, "orgs"))
get.my.organizations   <- function(ctx)               api.get.request(ctx, c("user", "orgs"))
get.organization       <- function(ctx, org)          api.get.request(ctx, c("orgs", org))
update.organization    <- function(ctx, org, content) api.patch.request(ctx, c("orgs", org), body=content)

# members
get.organization.members         <- function(ctx, org)       api.get.request(ctx, c("orgs", org, "members"))
is.member.of.organization        <- function(ctx, org, user) api.get.request(ctx, c("orgs", org, "members", user), expect.code=c(204, 404))
delete.member.from.organization  <- function(ctx, org, user) api.delete.request(ctx, c("orgs", org, "members", user))
get.organization.public.members  <- function(ctx, org)       api.get.request(ctx, c("orgs", org, "public_members"))
is.public.member.of.organization <- function(ctx, org, user) api.get.request(ctx, c("orgs", org, "public_members", user), expect.code=c(204, 404))
publicize.member.of.organization <- function(ctx, org, user) api.put.request(ctx, c("orgs", org, "public_members", user), expect.code=204)
conceal.member.of.organization   <- function(ctx, org, user) api.delete.request(ctx, c("orgs", org, "public_members", user))

# teams
get.organization.teams      <- function(ctx, org)             api.get.request(ctx, c("orgs", org, "teams"))
get.team                    <- function(ctx, id)              api.get.request(ctx, c("teams", id))
create.team                 <- function(ctx, org, content)    api.get.request(ctx, c("orgs", org, "teams"), body=content)
update.team                 <- function(ctx, id, content)     api.patch.request(ctx, c("teams", id), body=content)
delete.team                 <- function(ctx, id)              api.delete.request(ctx, c("teams", id))
get.team.members            <- function(ctx, id)              api.get.request(ctx, c("teams", id, "members"))
is.member.in.team           <- function(ctx, id, user)        api.get.request(ctx, c("teams", id, "members", user), expect.code=c(204, 404))
add.member.to.team          <- function(ctx, id, user)        api.put.request(ctx, c("teams", id, "members", user), expect.code=204)
delete.member.from.team     <- function(ctx, id, user)        api.delete.request(ctx, c("teams", id, "members", user))
get.team.repositories       <- function(ctx, id)              api.get.request(ctx, c("teams", id, "repos"))
is.repository.in.team       <- function(ctx, id, owner, repo) api.get.request(ctx, c("teams", id, "repos", owner, repo), expect.code=c(204, 404))
add.repository.to.team      <- function(ctx, id, owner, repo) api.put.request(ctx, c("teams", id, "repos", owner, repo), expect.code=204)
delete.repository.from.team <- function(ctx, id, owner, repo) api.delete.request(ctx, c("teams", id, "repos", owner, repo))

