################################################################################
# events

#' list public events
#'
#' @param ... the pagination parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of public events
get.public.events <- function(..., ctx = get.github.context())
  .api.get.request(ctx, c("events"), params=list(...))

#' list events for a given repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of repository events
get.repository.events <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "events"), params=list(...))

#' list issue events for a given repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of repository issue events
get.repository.issue.events <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", "events"), params=list(...))

#' list events for a network of repositories
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of events for the network of repositories
get.network.public.events <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("networks", owner, repo, "events"), params=list(...))

#' list public events for an organization
#'
#' @param org the organization
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of events for the network of repositories
get.organization.public.events <- function(org, ..., ctx = get.github.context())
  .api.get.request(ctx, c("orgs", org, "events"), params=list(...))

#' list events that a user has received
#'
#' @param user the user
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of events the user has received
get.user.received.events <- function(user, ..., ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "received_events"), params=list(...))

#' list public events that a user has received
#'
#' @param user the user
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of public events the user has received
get.user.public.received.events <- function(user, ..., ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "received_events", "public"), params=list(...))

#' list events that a user has performed
#'
#' @param user the user
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of events the user has performed. If user is the authenticated user,
#'         this includes private events. Otherwise, this list contains only public events.
get.user.performed.events <- function(user, ..., ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "events"), params=list(...))

#' list public events that a user has performed
#'
#' @param user the user
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of public events the user has performed.
get.user.public.performed.events <- function(user, ..., ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "events", "public"), params=list(...))

#' list events from the authenticated user organization
#'
#' @param org the organization
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/events/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of events 
get.my.organization.events <- function(org, ..., ctx = get.github.context())
  .api.get.request(ctx, c("users", ctx$user$login, "events", "orgs", org), params=list(...))

################################################################################
# notifications

#' list the current user's notifications
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/notifications/#list-your-notifications for details.
#'
#' @param ctx the github context object
#'
#' @return the list of notifications
get.my.notifications <- function(..., ctx=get.github.context())
  .api.get.request(ctx, c("notifications"), params=list(...))

#' list the current user's notifications for a given repo
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/notifications/#list-your-notifications-in-a-repository
#'
#' @param ctx the github context object
#'
#' @return the list of notifications
get.my.repository.notifications <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "notifications"), params=list(...))

#' mark my notifications as read
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/notifications/#mark-notifications-as-read
#'
#' @param ctx the github context object
#'
#' @return None
mark.my.notifications <- function(..., ctx = get.github.context())
  .api.put.request(ctx, c("notifications"), expect.code=205, params=list(...))

#' mark my notifications as read for a given repo
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/notifications/#mark-notifications-as-read-in-a-repository for 
#'
#' @param ctx the github context object
#'
#' @return none
mark.my.repository.notifications <- function(owner, repo, ..., ctx = get.github.context())
  .api.put.request(ctx, c("repos", owner, repo, "notifications"), expect.code=205, params=list(...))

#' get single thread notifications
#'
#' @param id the thread id
#'
#' @param ctx the github context object
#'
#' @return the thread
get.thread.notifications <- function(id, ctx = get.github.context())
  .api.get.request(ctx, c("notifications", "threads", id))

#' mark a single thread as read.
#'
#' @param id the thread id
#'
#' @param ctx the github context object
#'
#' @return none
mark.thread.notifications <- function(id, ctx = get.github.context())
  .api.patch.request(ctx, c("notifications", "threads", id), expect.code=205)

#' checks to see if the current user is subscribed to a thread.
#'
#' @param id the thread id
#'
#' @param ctx the github context object
#'
#' @return the response object
get.thread.notifications.subscription <- function(id, ctx = get.github.context())
  .api.get.request(ctx, c("notifications", "threads", id, "subscription"))

#' subscribes current user to a thread, or ignore thread. Subscribing to a thread is unnecessary if the user is already subscribed to the repository. Ignoring a thread will mute all future notifications (until you comment or get at-mentioned).
#'
#' @param id the thread id
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/notifications/#set-a-thread-subscription for details.
#'
#' @param ctx the github context object
#'
#' @return the response object
set.thread.notifications.subscription <- function(id, ..., ctx = get.github.context())
  .api.put.request(ctx, c("notifications", "threads", id, "subscription"), params=list(...))

#' deletes subscription info from thread.
#'
#' @param id the thread id
#'
#' @param ctx the github context object
#'
#' @return none
unset.thread.notifications.subscription <- function(id, ctx = get.github.context())
  .api.delete.request(ctx, c("notifications", "threads", id, "subscription"))

################################################################################
# starring

#' list people who starred a repo
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ctx the github context object
#'
#' @return user list
get.stargazers <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "stargazers"))

#' list repos starred by user
#'
#' @param user name of user
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/starring/#list-repositories-being-starred for details.
#'
#' @param ctx the github context object
#'
#' @return repo list
get.repositories.starred.by.user <- function(user, ..., ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "starred"), params=list(...))

#' list repos starred by current user
#'
#' @param ... extra parameters. See http://developer.github.com/v3/activity/starring/#list-repositories-being-starred for details.
#'
#' @param ctx the github context object
#'
#' @return repo list
get.repositories.starred.by.me <- function(..., ctx = get.github.context())
  .api.get.request(ctx, c("user", "starred"), params=list(...))

#' check if repository is starred by current user
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ctx the github context object
#'
#' @return TRUE if current user starred repo
is.repository.starred.by.me <- function(owner, repo, ctx = get.github.context())
  .api.test.request(ctx, c("user", "starred", owner, repo))

#' star a repository
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ctx the github context object
#'
#' @return none
star.repository <- function(owner, repo, ctx = get.github.context())
  .api.put.request(ctx, c("user", "starred", owner, repo), expect.code=204)

#' unstar a repository
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ctx the github context object
#'
#' @return none
unstar.repository <- function(owner, repo, ctx = get.github.context())
  .api.delete.request(ctx, c("user", "starred", owner, repo), expect.code=204)

################################################################################
# watching
# NB http://developer.github.com/changes/2012-9-5-watcher-api/

#' list repo watchers
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ctx the github context object
#'
#' @return list of repository watchers
get.watchers <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "subscribers"))

#' list repos watched by users
#'
#' @param user the user
#'
#' @param ctx the github context object
#'
#' @return list of repositories
get.repositories.watched.by.user <- function(user, ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "subscriptions"))

#' list repos watched by current user
#'
#' @param ctx the github context object
#'
#' @return list of repositories
get.repositories.watched.by.me <- function(ctx)
  .api.get.request(ctx, c("user", "subscriptions"))

#' get repository subscription info
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ctx the github context object
#'
#' @return subscription info
get.repository.subscription <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "subscription"))

#' set repository subscription info
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ... parameters to be set. See http://developer.github.com/v3/activity/watching/#set-a-repository-subscription
#'
#' @param ctx the github context object
#'
#' @return subscription info
set.repository.subscription <- function(owner, repo, ..., ctx = get.github.context())
  .api.put.request(ctx, c("repos", owner, repo, "subscription"), params=list(...))

#' clear repository subscription info
#'
#' @param owner repo owner
#'
#' @param repo name of repo
#'
#' @param ctx the github context object
#'
#' @return subscription info
unset.repository.subscription <- function(owner, repo, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "subscription"))
