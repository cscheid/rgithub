#' list the current user's gists
#'
#' @param ctx the github context object
#'
#' @return the list of gists
get.my.gists <- function(ctx = get.github.context())
  .api.get.request   (ctx, c("gists"))

#' list the gists of a given user
#'
#' @param user the given user
#'
#' @param ctx the github context object
#'
#' @return the list of gists
get.user.gists <- function(user, ctx = get.github.context())
  .api.get.request   (ctx, c("users", user, "gists"))

#' get a specific gist
#'
#' @param id the gist id
#'
#' @param version the gist version, optionally
#'
#' @param ctx the github context object
#'
#' @return the specific gist
get.gist <- function(id, version = NULL, ctx = get.github.context())
  .api.get.request   (ctx, c("gists", id, version))

#' star a gist
#'
#' @param id the gist id
#'
#' @param ctx the github context object
#'
#' @return none
star.gist <- function(id, ctx = get.github.context())
  .api.put.request   (ctx, c("gists", id, "star"), expect.code=204)

#' unstar a gist
#'
#' @param id the gist id
#'
#' @param ctx the github context object
#'
#' @return none
unstar.gist <- function(id, ctx = get.github.context())
  .api.delete.request(ctx, c("gists", id, "star"))

#' test if gist is starred
#'
#' @param id the gist id
#'
#' @param ctx the github context object
#'
#' @return TRUE if gist is starred
is.starred <- function(id, ctx = get.github.context())
  .api.test.request  (ctx, c("gists", id, "star"))

#' fork a gist
#'
#' @param id the gist id
#'
#' @param ctx the github context object
#'
#' @return the new gist
fork.gist <- function(id, ctx = get.github.context())
  .api.post.request  (ctx, c("gists", id, "forks"))

#' delete a gist
#'
#' @param id the gist id
#'
#' @param ctx the github context object
#'
#' @return none
delete.gist <- function(id, ctx = get.github.context())
  .api.delete.request(ctx, c("gists", id))

#' create a new gist
#'
#' @param content the JSON object describing the gist. see http://developer.github.com/v3/gists/#create-a-gist for details
#'
#' @param ctx the github context object
#'
#' @return the new gist
create.gist <- function(content, ctx = get.github.context())
  .api.post.request  (ctx, c("gists"), body=content)

#' Edit a gist
#'
#' @param id the gist id
#'
#' @param content the JSON object describing the updated gist. see http://developer.github.com/v3/gists/#edit-a-gist for details
#'
#' @param ctx the github context object
#'
#' @return the new gist
modify.gist <- function(id, content, ctx = get.github.context())
  .api.patch.request (ctx, c("gists", id), body=content)

################################################################################
# comments

#' Get comments for a gist
#'
#' @param id the gist id
#'
#' @param ctx the github context object
#'
#' @return the list of comments
get.gist.comments <- function(id, ctx = get.github.context())
  .api.get.request(ctx, c("gists", id, "comments"))

#' Get specific comment
#'
#' @param gist.id the gist id
#'
#' @param comment.id the comment id
#'
#' @param ctx the github context object
#'
#' @return the comment
get.gist.comment <- function(gist.id, comment.id, ctx = get.github.context())
  .api.get.request(ctx, c("gists", gist.id, "comment", comment.id))

#' Create gist comment
#'
#' @param gist.id the gist id
#'
#' @param content the JSON object describing the comment. see http://developer.github.com/v3/gists/comments/#create-a-comment for details
#'
#' @param ctx the github context object
#'
#' @return the comment
create.gist.comment <- function(gist.id, content, ctx = get.github.context())
  .api.post.request(ctx, c("gists", gist.id, "comments"), body=content, config=add_headers(Accept='application/vnd.github.v3.text+json'))

#' Edit gist comment
#'
#' @param gist.id the gist id
#'
#' @param comment.id the comment id
#'
#' @param content the JSON object describing the comment. see http://developer.github.com/v3/gists/comments/#edit-a-comment for details
#'
#' @param ctx the github context object
#'
#' @return the comment
modify.gist.comment <- function(gist.id, comment.id, content, ctx = get.github.context())
  .api.patch.request(ctx, c("gists", gist.id, "comments", comment.id), body=content, config=add_headers(Accept='application/vnd.github.v3.text+json'))

#' Delete gist comment
#'
#' @param gist.id the gist id
#'
#' @param comment.id the comment id
#'
#' @param ctx the github context object
#'
#' @return none
delete.gist.comment <- function(gist.id, comment.id, ctx = get.github.context())
  .api.delete.request(ctx, c("gists", gist.id, "comments", comment.id))
