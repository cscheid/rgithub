own.gists       <- function(ctx, user) api.get.request   (ctx, c("gists"))
gists.from.user <- function(ctx, user) api.get.request   (ctx, c("users", user, "gists"))
get.gist        <- function(ctx, id)   api.get.request   (ctx, c("gists", id))
star.gist       <- function(ctx, id)   api.put.request   (ctx, c("gists", id, "star"), 204)
unstar.gist     <- function(ctx, id)   api.delete.request(ctx, c("gists", id, "star"), 204)
is.starred      <- function(ctx, id)   api.get.request   (ctx, c("gists", id, "star"), c(204, 404))
fork.gist       <- function(ctx, id)   api.post.request  (ctx, c("gists", id, "forks"), 201)
delete.gist     <- function(ctx, id)   api.delete.request(ctx, c("gists", id), 204)

create.gist <- function(ctx, ...)
{
  stop("TODO");
}

edit.gist <- function(ctx, ...)
{
  stop("TODO");
}
