# events

public.events <- function(ctx) api.get.request(ctx, c("events"))
repository.events <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "events"))
repository.issue.events <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "issues", "events"))
# TODO I believe the documentation on http://developer.github.com/v3/activity/events/ is wrong for network.public.events, but in case it isn't...
network.public.events <- function(ctx, owner, repo) api.get.request(ctx, c("networks", owner, repo, "events"))
organization.public.events <- function(ctx, org) api.get.request(ctx, c("orgs", org, "events"))
user.received.events <- function(ctx, user) api.get.request(ctx, c("users", user, "received_events"))
user.public.received.events <- function(ctx, user) api.get.request(ctx, c("users", user, "received_events", "public"))
user.performed.events <- function(ctx, user) api.get.request(ctx, c("users", user, "events"))
user.public.performed.events <- function(ctx, user) api.get.request(ctx, c("users", user, "events", "public"))
my.organization.events <- function(ctx, org) api.get.request(ctx, c("users", ctx$user$login, "events", "orgs", org))

# notifications

