#' get all issues across all the authenticated user's visible repositories including owned repositories, member repositories, and organization repositories
#
#' @param ... extra parameters. See http://developer.github.com/v3/issues/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of issues
get.all.my.issues <- function(..., ctx = get.github.context())
  .api.get.request(ctx, c("issues"), params=list(...))

#' List all issues across owned and member repositories for the authenticated user:
#
#' @param ... extra parameters. See http://developer.github.com/v3/issues/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of issues
get.my.issues <- function(..., ctx = get.github.context())
  .api.get.request(ctx, c("user", "issues"), params=list(...))

#' List all issues across an organization of the authenticated user:
#'
#' @param org the organization
#'
#' @param ... extra parameters. See http://developer.github.com/v3/issues/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of issues
get.organization.issues <- function(org, ..., ctx = get.github.context())
  .api.get.request(ctx, c("orgs", org, "issues"), params=list(...))

#' List all issues for a repo
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param ... extra parameters. See http://developer.github.com/v3/issues/ for details
#'
#' @param ctx the github context object
#'
#' @return the list of issues
get.repository.issues <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues"), params=list(...))

#' Create issue
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param content the JSON object with the issue content. See http://developer.github.com/v3/issues/#create-an-issue for details
#'
#' @param ctx the github context object
#'
#' @return the list of issues
create.issue <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "issues"), body=content)

#' Modify issue
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param number the issue number
#'
#' @param content the JSON object with the issue content. See http://developer.github.com/v3/issues/#edit-an-issue for details
#'
#' @param ctx the github context object
#'
#' @return the list of issues
modify.issue <- function(owner, repo, number, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "issues", number), body=content)

################################################################################
# assignees

#' Get list of assignees for a repo
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param ctx the github context object
#'
#' @return the list of assignees
get.assignees <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "assignees"))

#' Test if user is assignee in a repo
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param assignee the user to check
#'
#' @param ctx the github context object
#'
#' @return TRUE if user is assignee
is.assignee <- function(owner, repo, assignee, ctx = get.github.context())
  .api.test.request(ctx, c("repos", owner, repo, "assignees", assignee))

################################################################################
# comments

#' Get list of comments for an issue
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param number the issue number
#'
#' @param ctx the github context object
#'
#' @return the list of comments
get.issue.comments <- function(owner, repo, number, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", number, "comments"))

#' Get list of comments for an issue
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param ... extra parameters. See http://developer.github.com/v3/issues/comments/#list-comments-in-a-repository for details.
#'
#' @param ctx the github context object
#'
#' @return the list of comments
get.all.repository.issues.comments <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", "comments"), params=list(...))

#' Get specific comment
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param issue.number the issue number
#'
#' @param comment.number the comment number
#'
#' @param ctx the github context object
#'
#' @return the comment
get.issue.comment <- function(owner, repo, issue.number, comment.number, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments", comment.number))

#' Create issue comment
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param issue.number the issue number
#'
#' @param content the JSON object describing the issue comment. See http://developer.github.com/v3/issues/comments/#create-a-comment for details.
#'
#' @param ctx the github context object
#'
#' @return the comment
create.issue.comment <- function(owner, repo, issue.number, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments"), body=content)

#' Modify issue comment
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param issue.number the issue number
#'
#' @param content.number the issue number
#'
#' @param content the JSON object describing the issue comment. See http://developer.github.com/v3/issues/comments/#edit-a-comment for details.
#'
#' @param ctx the github context object
#'
#' @return the comment
modify.issue.comment <- function(owner, repo, issue.number, comment.number, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments", comment.number), body=content)

#' Delete issue comment
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param issue.number the issue number
#'
#' @param content.number the issue number
#'
#' @param ctx the github context object
#'
#' @return None
delete.issue.comment <- function(owner, repo, issue.number, comment.number, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "issues", issue.number, "comments", comment.number))

################################################################################
# events

get.issue.events <- function(owner, repo, issue.number, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", issue.number, "events"))
repository.issue.events <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", "events"))
repository.issue.event  <- function(owner, repo, event.number, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", "events", event.number))

# labels
get.repository.labels <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "labels"))
get.repository.label <- function(owner, repo, name, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "labels", name))
create.repository.label <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "labels"), body=content)
modify.repository.label <- function(owner, repo, name, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "labels", name), body=content)
delete.repository.label <- function(owner, repo, name, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "labels", name))

get.issue.labels <- function(owner, repo, issue.number, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"))
add.issue.labels <- function(owner, repo, issue.number, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"), expect.code=200, body=content)
delete.issue.labels <- function(owner, repo, issue.number, name, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels", name))
replace.issue.labels <- function(owner, repo, issue.number, content, ctx = get.github.context())
  .api.put.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"), body=content)
delete.all.issue.labels <- function(owner, repo, issue.number, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "issues", issue.number, "labels"))
get.milestone.labels <- function(owner, repo, milestone.number, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "milestones", milestone.number, "labels"))

# milestones

get.milestones <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "milestones"))
get.milestone <- function(owner, repo, milestone.number, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "milestones", milestone.number))
create.milestone <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "milestones"), body=content)
modify.milestone <- function(owner, repo, milestone.number, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "milestones", milestone.number), body=content)
delete.milestone <- function(owner, repo, milestone.number, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "milestones", milestone.number))
