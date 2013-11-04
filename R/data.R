# blobs
get.blob <- function(owner, repo, sha, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "git", "blobs", sha))
create.blob <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "git", "blobs"), body=content)

# commits
get.commit <- function(owner, repo, sha, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "git", "commits", sha))
create.commit <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "git", "commits", body=content))

# references
get.reference <- function(owner, repo, ref, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "git", "refs", ref))
get.all.references <- function(owner, repo, subnamespace=NULL, ctx = get.github.context()) {
  if (is.null(subnamespace))
    api.get.request(ctx, c("repos", owner, repo, "git", "refs"))
  else
    api.get.request(ctx, c("repos", owner, repo, "git", "refs", subnamespace))
}
create.reference <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "git", "refs"), body=content)
update.reference <- function(owner, repo, ref, content, ctx = get.github.context())
  api.patch.request(ctx, c("repos", owner, repo, "git", "refs", ref), body=content)
delete.reference <- function(owner, repo, ref, ctx = get.github.context())
  api.delete.request(ctx, c("repos", owner, repo, "git", "refs", ref))

# tags
get.tag <- function(owner, repo, sha, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "git", "tags", sha))
create.tag <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "git", "tags"), body=content)

# trees
get.tree <- function(owner, repo, sha, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "git", "trees", sha), params=list(...))
create.tree <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "git", "trees"), body=content)


