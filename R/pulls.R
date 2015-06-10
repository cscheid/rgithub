#' list all pull requests
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param ... extra parameters. See http://developer.github.com/v3/pulls/#list-pull-requests for details
#'
#' @param ctx the github context object
#'
#' @return the list of pull requests
get.pull.requests <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "pulls"), params=list(...))

#' get a specific pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param id the pull request id
#'
#' @param ctx the github context object
#'
#' @return the specific pull request
get.pull.request <- function(owner, repo, id, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "pulls", id))

#' create a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param content the JSON object representing the new pull request. See http://developer.github.com/v3/pulls/#create-a-pull-request for details.
#'
#' @param ctx the github context object
#'
#' @return the specific pull request
create.pull.request <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "pulls"), body=content)

#' edit pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param id the pull request id
#'
#' @param content the JSON object representing the pull request. See http://developer.github.com/v3/pulls/#update-a-pull-request for details.
#'
#' @param ctx the github context object
#'
#' @return the specific pull request
modify.pull.request <- function(owner, repo, id, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "pulls", id), body=content)

#' list commits for a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param id the pull request id
#'
#' @param ctx the github context object
#'
#' @param ... extra parameters. See
#'   https://developer.github.com/v3/pulls/#list-commits-on-a-pull-request for details
#' @return the list of pull request commits
get.pull.request.commits <- function(owner, repo, id, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "pulls", id, "commits"),
                   params=list(...))

#' list files for a pull request
#' 
#' @param owner the repo owner
#'   
#' @param repo the repo name
#'   
#' @param id the pull request id
#'   
#' @param ctx the github context object
#'   
#' @param ... extra parameters. See
#'   http://developer.github.com/v3/pulls/#list-pull-requests for details
#'   
#' @return the list of pull request files
get.pull.request.files <-
  function(owner, repo, id, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "pulls", id, "files"),
                   params=list(...))

#' test if pull request has been merged
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param id the pull request id
#'
#' @param ctx the github context object
#'
#' @return TRUE if pull request has been merged
is.pull.request.merged <- function(owner, repo, id, ctx = get.github.context())
  .api.test.request(ctx, c("repos", owner, repo, "pulls", id, "merge"))

#' merge a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param id the pull request id
#'
#' @param ... extra parameters to control the merge. See http://developer.github.com/v3/pulls/#merge-a-pull-request-merge-buttontrade for details.
#'
#' @param ctx the github context object
#'
#' @return none
perform.merge.pull.request <- function(owner, repo, id, ..., ctx = get.github.context()) # "perform" here is just awful, but makes the S3method checker in CRAN happy.
  .api.put.request(ctx, c("repos", owner, repo, "pulls", id, "merge"), params=list(...))

################################################################################
# comments

#' List comments on a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param id the pull request id
#'
#' @param ctx the github context object
#'
#' @return the list of comments for the pull request
get.pull.request.comments <- function(owner, repo, id, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "pulls", id, "comments"))

#' List comments on all pull requests for a repo
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param ... extra parameters to control pagination. See http://developer.github.com/v3/pulls/comments/#list-comments-in-a-repository for details.
#'
#' @param ctx the github context object
#'
#' @return the list of comments for the pull request
get.pull.requests.comments <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "pulls", "comments"), params=list(...))

#' Get specific comment for a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param comment.id the id of the comment
#'
#' @param ctx the github context object
#'
#' @return the comment
get.pull.requests.comment <- function(owner, repo, comment.id, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "pulls", "comments", comment.id))

#' Create a comment on a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param pull.id the id of the pull request
#'
#' @param content the JSON object describing the content. See http://developer.github.com/v3/pulls/comments/#create-a-comment for details.
#'
#' @param ctx the github context object
#'
#' @return the comment
create.pull.request.comment <- function(owner, repo, pull.id, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "pulls", pull.id, "comments"), body=content)

#' Modify a comment on a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param pull.id the id of the pull request
#'
#' @param content the JSON object describing the edited content. See http://developer.github.com/v3/pulls/comments/#edit-a-comment for details.
#'
#' @param ctx the github context object
#'
#' @return the comment
modify.pull.request.comment <- function(owner, repo, pull.id, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "pulls", pull.id, "comments"), body=content)

#' Delete a comment on a pull request
#'
#' @param owner the repo owner
#'
#' @param repo the repo name
#'
#' @param comment.id the id of the pull request
#'
#' @param ctx the github context object
#'
#' @return the comment
delete.pull.request.comment <- function(owner, repo, comment.id, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "pulls", "comments", comment.id))
