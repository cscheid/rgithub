get.user      <- function(ctx, user)    api.get.request(ctx, c("users", user), config=add_headers("User-Agent" = "rcloud", Accept = "application/json"))
get.myself    <- function(ctx)          api.get.request(ctx, "user")
update.myself <- function(ctx, content) api.patch.request(ctx, "user", body=content)
get.users     <- function(ctx, ...)     api.get.request(ctx, c("users"), params=.rest(...))

# emails
get.my.emails <- function(ctx)          api.get.request(ctx, c("user", "emails"))
add.emails    <- function(ctx, content) api.post.request(ctx, c("user", "emails"), body=content)
delete.emails <- function(ctx, content) api.delete.request(ctx, c("user", "emails"), body=content)

# followers/following
get.user.followers <- function(ctx, user) api.get.request(ctx, c("users", user, "followers"))
get.my.followers   <- function(ctx)       api.get.request(ctx, c("user", "followers"))
get.user.following <- function(ctx, user) api.get.request(ctx, c("users", user, "following"))
get.my.following   <- function(ctx)       api.get.request(ctx, c("user", "following"))
am.following.user  <- function(ctx, user) api.test.request(ctx, c("user", "following", user))
follow.user        <- function(ctx, user) api.put.request(ctx, c("user", "following", user), expect.code=204)
unfollow.user      <- function(ctx, user) api.delete.request(ctx, c("user", "following", user), expect.code=204)

# keys
get.user.keys <- function(ctx, user)        api.get.request(ctx, c("users", user, "keys"))
get.my.keys   <- function(ctx)              api.get.request(ctx, c("user", "keys"))
get.key       <- function(ctx, id)          api.get.request(ctx, c("user", "keys", id))
create.key    <- function(ctx, content)     api.post.request(ctx, c("user", "keys"), body=content)
update.key    <- function(ctx, id, content) api.patch.request(ctx, c("user", "keys", id), body=content)
delete.key    <- function(ctx, id)          api.delete.request(ctx, c("user", "keys"), body=content)
