################################################################################
# General user information

#' Get information on some user
#'
#' @param user the user
#'
#' @param ctx the github context object
#'
#' @return Information about the user
get.user <- function(user, ctx = get.github.context())
  .api.get.request(ctx, c("users", user))

#' Get information on the current user
#'
#' @param ctx the github context object
#'
#' @return Information about the user
get.myself <- function(ctx = get.github.context())
  .api.get.request(ctx, "user")

#' Change information about the current user
#'
#' @param content JSON object describing changes, see
#' http://developer.github.com/v3 for details
#'
#' @param ctx the github context object
#'
#' @return Updated information about the user
modify.myself <- function(content, ctx = get.github.context())
  .api.patch.request(ctx, "user", body = content)

#' Get all github users
#'
#' @param ... extra parameters. Use "since" for appropriate pagination
#'
#' @param ctx the github context object
#'
#' @return A list of users
get.users <- function(..., ctx = get.github.context())
  .api.get.request(ctx, c("users"), params=list(...))

################################################################################
# emails

#' Get the list of emails of the current user
#'
#' @param ctx the github context object
#'
#' @return A list of emails
get.my.emails <- function(ctx = get.github.context())
  .api.get.request(ctx, c("user", "emails"))

#' Add emails to the account
#'
#' @param content either an email or a list of emails
#'
#' @param ctx the github context object
#'
#' @return The new list of emails
add.emails <- function(content, ctx = get.github.context())
  .api.post.request(ctx, c("user", "emails"), body=content)

#' Delete emails from the account
#'
#' @param content either an email or a list of emails
#'
#' @param ctx the github context object
#'
#' @return Nothing
delete.emails <- function(content, ctx = get.github.context())
  .api.delete.request(ctx, c("user", "emails"))

################################################################################
# followers/following

#' Get the list of followers for a given user
#'
#' @param user the user
#'
#' @param ctx the github context object
#'
#' @return the list of followers
get.user.followers <- function(user, ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "followers"))

#' Get the list of followers for the current user
#'
#' @param ctx the github context object
#'
#' @return the list of followers
get.my.followers <- function(ctx = get.github.context())
  .api.get.request(ctx, c("user", "followers"))

#' List who a user is following
#'
#' @param user the user
#'
#' @param ctx the github context object
#'
#' @return the list of followers
get.user.following <- function(user, ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "following"))

#' List who is following the current user
#'
#' @param ctx the github context object
#'
#' @return the list of followers
get.my.following <- function(ctx = get.github.context())
  .api.get.request(ctx, c("user", "following"))

#' Test whether current user is following given user
#'
#' @param user the given user
#'
#' @param ctx the github context object
#'
#' @return TRUE or FALSE
am.following.user <- function(user, ctx = get.github.context())
  .api.test.request(ctx, c("user", "following", user))

#' Start following a given user
#'
#' @param user the given user
#'
#' @param ctx the github context object
#'
#' @return none
follow.user <- function(user, ctx = get.github.context())
  .api.put.request(ctx, c("user", "following", user), expect.code=204)

#' Stop following a given user
#'
#' @param user the given user
#'
#' @param ctx the github context object
#'
#' @return none
unfollow.user <- function(user, ctx = get.github.context())
  .api.delete.request(ctx, c("user", "following", user), expect.code=204)

################################################################################
# keys

#' Get public keys for a given user
#'
#' @param user the given user
#'
#' @param ctx the github context object
#'
#' @return list of keys
get.user.keys <- function(user, ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "keys"))

#' Get public keys for the current user
#'
#' @param ctx the github context object
#'
#' @return list of keys
get.my.keys <- function(ctx = get.github.context())
  .api.get.request(ctx, c("user", "keys"))

#' Get a public key with some id
#'
#' @param id the public key id
#'
#' @param ctx the github context object
#'
#' @return the public key
get.key <- function(id, ctx = get.github.context())
  .api.get.request(ctx, c("user", "keys", id))

#' Add a public key with some id
#'
#' @param content the public key 
#'
#' @param ctx the github context object
#'
#' @return the added public key
create.key <- function(content, ctx = get.github.context())
  .api.post.request(ctx, c("user", "keys"), body=content)

#' Update a public key with some id
#'
#' @param id the public key id
#'
#' @param content the public key
#'
#' @param ctx the github context object
#'
#' @return the updated public key
modify.key <- function(id, content, ctx = get.github.context())
  .api.patch.request(ctx, c("user", "keys", id), body=content)

#' Delete a public key with some id
#'
#' @param id the public key id 
#'
#' @param ctx the github context object
#'
#' @return None
delete.key <- function(id, ctx = get.github.context())
  .api.delete.request(ctx, c("user", "keys"))
