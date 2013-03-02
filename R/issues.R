get.all.my.issues       <- function(ctx, ...) api.get.request(ctx, c("issues"), params=.rest(...))
get.my.issues           <- function(ctx, ...) api.get.request(ctx, c("user", "issues"), params=.rest(...))
get.organization.issues <- function(ctx, org, ...) api.get.request(ctx, c("orgs", org, "issues"), params=.rest(...))
get.repository.issues   <- function(ctx, owner, repo, ...) api.get.request(ctx, c("repos", owner, repo, "issues"), params=.rest(...))

create.issue <- function(ctx, owner, repo, content) api.post.request(ctx, c("repos", owner, repo, "issues"), body=content)
update.issue <- function(ctx, owner, repo, number, content) api.patch.request(ctx, c("repos", owner, repo, "issues", number), body=content)

# assignees
get.assignees <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "assignees"))
is.assignee   <- function(ctx, owner, repo, assignee) api.test.request(ctx, c("repos", owner, repo, "assignees", assignee))

# comments
get.issue.comments <- function(ctx, owner, repo, number, ...) api.get.request(ctx, c("repos", owner, repo, "issues", number, "comments"), params=.rest(...))
get.issue.comment <- function(ctx, owner, repo, issue.number, comment.number) api.get.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments", comment.number))
create.issue.comment <- function(ctx, owner, repo, issue.number, content) api.post.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments"), body=content)
update.issue.comment <- function(ctx, owner, repo, issue.number, comment.number, content) api.patch.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments", comment.number), body=content)
delete.issue.comment <- function(ctx, owner, repo, issue.number, comment.number) api.delete.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments", comment.number))

# events
get.issue.events        <- function(ctx, owner, repo, issue.number) api.get.request(ctx, c("repos", owner, repo, "issues", issue.number, "events"))
repository.issue.events <- function(ctx, owner, repo)               api.get.request(ctx, c("repos", owner, repo, "issues", "events"))
repository.issue.event  <- function(ctx, owner, repo, event.number) api.get.request(ctx, c("repos", owner, repo, "issues", "events", event.number))

# labels
get.repository.labels <- function(ctx, owner, repo)                api.get.request(ctx, c("repos", owner, repo, "labels"))
get.repository.label  <- function(ctx, owner, repo, name)          api.get.request(ctx, c("repos", owner, repo, "labels", name))
create.label          <- function(ctx, owner, repo, content)       api.post.request(ctx, c("repos", owner, repo, "labels"), body=content)
update.label          <- function(ctx, owner, repo, name, content) api.patch.request(ctx, c("repos", owner, repo, "labels", name), body=content)
delete.label          <- function(ctx, owner, repo, name)          api.delete.request(ctx, c("repos", owner, repo, "labels", name))

get.issue.labels     <- function(ctx, owner, repo, issue.number)          api.get.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"))
add.labels           <- function(ctx, owner, repo, issue.number, content) api.post.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"), expect.code=200, body=content)
delete.labels        <- function(ctx, owner, repo, issue.number, name)    api.delete.request(ctx, c("repos", owner, repo, "labels", issue.number, "labels", name))
replace.labels       <- function(ctx, owner, repo, issue.number, content) api.put.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"), body=content)
delete.all.labels    <- function(ctx, owner, repo, issue.number)          api.delete.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"), body=content)
get.milestone.labels <- function(ctx, owner, repo, milestone.number)      api.get.request(ctx, c("repos", owner, repo, "milestones", milestone.number, "labels"))

# milestones

get.milestones   <- function(ctx, owner, repo)                            api.get.request(ctx, c("repos", owner, repo, "milestones"))
get.milestone    <- function(ctx, owner, repo, milestone.number)          api.get.request(ctx, c("repos", owner, repo, "milestones", milestone.number))
create.milestone <- function(ctx, owner, repo, content)                   api.post.request(ctx, c("repos", owner, repo, "milestones"), body=content)
update.milestone <- function(ctx, owner, repo, milestone.number, content) api.patch.request(ctx, c("repos", owner, repo, "milestones", milestone.number), body=content)
delete.milestone <- function(ctx, owner, repo, milestone.number)          api.delete.request(ctx, c("repos", owner, repo, "milestones", milestone.number))
