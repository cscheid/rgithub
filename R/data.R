# blobs
get.blob <- function(ctx, owner, repo, sha) api.get.request(ctx, c("repos", owner, repo, "git", "blobs", sha))
create.blob <- function(ctx, owner, repo, content) api.post.request(ctx, c("repos", owner, repo, "git", "blobs"), body=content)

# commits
get.commit <- function(ctx, owner, repo, sha) api.get.request(ctx, c("repos", owner, repo, "git", "commits", sha))
create.commit <- function(ctx, owner, repo, content) api.post.request(ctx, c("repos", owner, repo, "git", "commits", body=content))

# references
get.reference <- function(ctx, owner, repo, ref) api.get.request(ctx, c("repos", owner, repo, "git", "refs", ref))
get.all.references <- function(ctx, owner, repo, subnamespace=NULL) {
  if (is.null(subnamespace))
    api.get.request(ctx, c("repos", owner, repo, "git", "refs"))
  else
    api.get.request(ctx, c("repos", owner, repo, "git", "refs", subnamespace))
}
create.reference <- function(ctx, owner, repo, content) api.post.request(ctx, c("repos", owner, repo, "git", "refs"), expect_code=201, body=content)
update.reference <- function(ctx, owner, repo, ref, content) api.patch.request(ctx, c("repos", owner, repo, "git", "refs", ref), body=content)
delete.reference <- function(ctx, owner, repo, ref) api.delete.request(ctx, c("repos", owner, repo, "git", "refs", ref))

# tags
get.tag <- function(ctx, owner, repo, sha) api.get.request(ctx, c("repos", owner, repo, "git", "tags", sha))
