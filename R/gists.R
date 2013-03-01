own.gists       <- function(ctx, user)    api.get.request   (ctx, c("gists"))
gists.from.user <- function(ctx, user)    api.get.request   (ctx, c("users", user, "gists"))
get.gist        <- function(ctx, id)      api.get.request   (ctx, c("gists", id))
star.gist       <- function(ctx, id)      api.put.request   (ctx, c("gists", id, "star"), expect.code=204)
unstar.gist     <- function(ctx, id)      api.delete.request(ctx, c("gists", id, "star"))
is.starred      <- function(ctx, id)      api.get.request   (ctx, c("gists", id, "star"), expect.code=c(204, 404))
fork.gist       <- function(ctx, id)      api.post.request  (ctx, c("gists", id, "forks"))
delete.gist     <- function(ctx, id)      api.delete.request(ctx, c("gists", id))
create.gist     <- function(ctx, content) api.post.request  (ctx, c("gists"), body=content)
edit.gist       <- function(ctx, id)      api.patch.request (ctx, c("gists", id), body=content)

# comments
gist.comments <- function(ctx, id) api.get.request(ctx, c("gists", id, "comments"))
gist.comment  <- function(ctx, gist.id, comment.id) api.get.request(ctx, c("gists", gist.id, "comment", comment.id))
create.gist.comment <- function(ctx, gist.id, content) api.post.request(ctx, c("gists", gist.id, "comments"), body=content)
edit.gist.comment <- function(ctx, gist.id, comment.id, content) api.patch.request(ctx, c("gists", gist.id, "comments", comment.id), body=content)
delete.gist.comment <- function(ctx, gist.id, comment.id) api.patch.request(ctx, c("gists", gist.id, "comments", comment.id))

