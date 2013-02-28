own.gists <- function(ctx, user)
{
  api.get.request(ctx, c("gists"))
}

gists.from.user <- function(ctx, user)
{
  api.get.request(ctx, c("users", user, "gists"))
}

get.gist <- function(ctx, id)
{
  api.get.request(ctx, c("gists", id))
}

create.gist <- function(ctx, ...)
{
  stop("TODO");
}

edit.gist <- function(ctx, ...)
{
  stop("TODO");
}

star.gist <- function(ctx, id)
{
  api.put.request(ctx, c("gists", id, "star"))
}
