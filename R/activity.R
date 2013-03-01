# events
public.events                <- function(ctx)              api.get.request(ctx, c("events"))
repository.events            <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "events"))
repository.issue.events      <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "issues", "events"))
# TODO I believe the documentation on http://developer.github.com/v3/activity/events/ is wrong for network.public.events, but in case it isn't...
network.public.events        <- function(ctx, owner, repo) api.get.request(ctx, c("networks", owner, repo, "events"))
organization.public.events   <- function(ctx, org)         api.get.request(ctx, c("orgs", org, "events"))
user.received.events         <- function(ctx, user)        api.get.request(ctx, c("users", user, "received_events"))
user.public.received.events  <- function(ctx, user)        api.get.request(ctx, c("users", user, "received_events", "public"))
user.performed.events        <- function(ctx, user)        api.get.request(ctx, c("users", user, "events"))
user.public.performed.events <- function(ctx, user)        api.get.request(ctx, c("users", user, "events", "public"))
my.organization.events       <- function(ctx, org)         api.get.request(ctx, c("users", ctx$user$login, "events", "orgs", org))

# notifications
my.notifications                        <- function(ctx, ...)              api.get.request(ctx, c("notifications"), params=.rest(...))
my.repository.notifications             <- function(ctx, owner, repo, ...) api.get.request(ctx, c("repos", owner, repo, "notifications"), params=.rest(...))
mark.my.notifications                   <- function(ctx, ...)              api.put.request(ctx, c("notifications"), expect.code=205, params=.rest(...))
mark.my.repository.notifications        <- function(ctx, owner, repo, ...) api.put.request(ctx, c("repos", owner, repo, "notifications"), expect.code=205, params=.rest(...))
thread.notifications                    <- function(ctx, id)               api.get.request(ctx, c("notifications", "threads", id))
mark.thread.notifications               <- function(ctx, id, ...)          api.patch.request(ctx, c("notifications", "threads", id), expect.code=205, params=.rest(...))
thread.notifications.subscription       <- function(ctx, id)               api.get.request(ctx, c("notifications", "threads", id, "subscription"))
set.thread.notifications.subscription   <- function(ctx, id, ...)          api.put.request(ctx, c("notifications", "threads", id, "subscription"), params=.rest(...))
unset.thread.notifications.subscription <- function(ctx, id)               api.delete.request(ctx, c("notifications", "threads", id, "subscription"))

# starring
stargazers                   <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "stargazers"))
repositories.starred.by.user <- function(ctx, user, ...)   api.get.request(ctx, c("users", user, "starred"), params=.rest(...))
repositories.starred.by.me   <- function(ctx, ...)         api.get.request(ctx, c("user", "starred"), params=.rest(...))
is.repository.starred.by.me  <- function(ctx, owner, repo) api.get.request(ctx, c("user", "starred", owner, repo), expect.code=c(204, 404))
star.repository              <- function(ctx, owner, repo) api.put.request(ctx, c("user", "starred", owner, repo), expect.code=204)
unstar.repository            <- function(ctx, owner, repo) api.delete.request(ctx, c("user", "starred", owner, repo), expect.code=204)

# watching
# NB http://developer.github.com/changes/2012-9-5-watcher-api/
watchers <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "subscribers"))
repositories.watched.by.user <- function(ctx, user) api.get.request(ctx, c("users", user, "subscriptions"))
repositories.watched.by.me   <- function(ctx,) api.get.request(ctx, c("user", "subscriptions"))
repository.subscription <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "subscription"))
set.repository.subscription <- function(ctx, owner, repo, ...) api.put.request(ctx, c("repos", owner, repo, "subscription"), params=.rest(...))
unset.repository.subscription <- function(ctx, owner, repo) api.delete.request(ctx, c("repos", owner, repo, "subscription"))
