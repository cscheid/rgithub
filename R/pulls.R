pull.requests <- function(ctx, owner, repo, ...) api.get.request(ctx, c("repos", owner, repo, "pulls"), params=.rest(...))
pull.request <- function(ctx, owner, repo, id) api.get.request(ctx, c("repos", owner, repo, "pulls", id))
create.pull.request <- function(ctx, owner, repo, content) api.post.request(ctx, c("repos", owner, repo, "pulls"), body=content)
update.pull.request <- function(ctx, owner, repo, id, content) api.patch.request(ctx, c("repos", owner, repo, "pulls", id), body=content)
pull.request.commits <- function(ctx, owner, repo, id) api.get.request(ctx, c("repos", owner, repo, "pulls", id, "commits"))
pull.request.files <-  function(ctx, owner, repo, id) api.get.request(ctx, c("repos", owner, repo, "pulls", id, "files"))
is.pull.request.merged <- function(ctx, owner, repo, id) api.get.request(ctx, c("repos", owner, repo, "pulls", id, "merge"), expect.code=c(204, 404))
merge.pull.request <- function(ctx, owner, repo, id, ...) api.put.request(ctx, c("repos", owner, repo, "pulls", id, "merge"), params=.rest(...))

# comments

pull.request.comments <- function(ctx, owner, repo, id) api.get.request(ctx, c("repos", owner, repo, "pulls", id, "comments"))
pull.requests.comments <- function(ctx, owner, repo, ...) api.get.request(ctx, c("repos", owner, repo, "pulls", "comments"), params=.rest(...))
pull.requests.comment <- function(ctx, owner, repo, comment.id) api.get.request(ctx, c("repos", owner, repo, "pulls", "comments", comment.id))
create.pull.request.comment <- function(ctx, owner, repo, pull.id, content) api.post.request(ctx, c("repos", owner, repo, "pulls", pull.id, "comments"), body=content)
update.pull.request.comment <- function(ctx, owner, repo, pull.id, content) api.patch.request(ctx, c("repos", owner, repo, "pulls", pull.id, "comments"), body=content)
delete.pull.request.comment <- function(ctx, owner, repo, comment.id) api.delete.request(ctx, c("repos", owner, repo, "pulls", "comments", comment.id))
