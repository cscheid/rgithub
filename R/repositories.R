get.my.repositories <- function(..., ctx = get.github.context())
  api.get.request(ctx, c("user", "repos"), params=list(...))
get.user.repositories <- function(user, ..., ctx = get.github.context())
  api.get.request(ctx, c("users", user, "repos"), params=list(...))
get.organization.repositories <- function(org, ..., ctx = get.github.context())
  api.get.request(ctx, c("orgs", org, "repos"), params=list(...))
get.all.repositories <- function(..., ctx = get.github.context())
  api.get.request(ctx, c("repositories"), params=list(...))
create.repository <- function(..., ctx = get.github.context())
  api.post.request(ctx, c("user", "repos"), body=content)
create.organization.repository <- function(org, ..., ctx = get.github.context())
  api.post.request(ctx, c("orgs", org, "repos"), body=content)
get.repository <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo))
update.repository <- function(owner, repo, content, ctx = get.github.context())
  api.patch.request(ctx, c("repos", owner, repo), body=content)
get.repository.contributors <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "contributors"))
get.repository.languages <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "languages"))
get.repository.teams <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "teams"))
get.repository.tags <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "tags"))
get.repository.branches <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "branches"))
get.repository.branch <- function(owner, repo, branch, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "branches", branch))
delete.repository <- function(owner, repo, ctx = get.github.context())
  api.delete.request(ctx, c("repos", owner, repo))

# collaborators
get.repository.collaborators <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "collaborators"))
is.repository.collaborator <- function(owner, repo, user, ctx = get.github.context())
  api.test.request(ctx, c("repos", owner, repo, "collaborators", user))
add.repository.collaborator <- function(owner, repo, user, ctx = get.github.context())
  api.put.request(ctx, c("repos", owner, repo, "collaborators", user), expect.code=204)
delete.repository.collaborator <- function(owner, repo, user, ctx = get.github.context())
  api.delete.request(ctx, c("repos", owner, repo, "collaborators", user))

# comments
get.repository.comments <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "comments"))
get.repository.commit.comments <- function(owner, repo, sha, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "commits", sha, "comments"))
create.commit.comment <- function(owner, repo, sha, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "commits", sha, "comments"), body=content)
get.commit.comment <- function(owner, repo, id, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "comments", id))
update.commit.comment <- function(owner, repo, id, content, ctx = get.github.context())
  api.patch.request(ctx, c("repos", owner, repo, "comments", id), body=content)
delete.commit.comment <- function(owner, repo, id, ctx = get.github.context())
  api.delete.request(ctx, c("repos", owner, repo, "comments", id))

# commits
get.repository.commits <- function(owner, repo, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "commits"), params=list(...))
get.repository.commit <- function(owner, repo, sha, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "commits", sha))
get.repository.diff <- function(owner, repo, sha1, sha2, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "compare", str_c(sha1, "...", sha2)))

# contents
get.repository.readme <- function(owner, repo, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "readme"), params=list(...))
get.repository.path <- function(owner, repo, path, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "contents", path), params=list(...))
get.repository.tarball <- function(owner, repo, ref, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "tarball", ref), params=list(...))
get.repository.zipball <- function(owner, repo, ref, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "zipball", ref), params=list(...))

# downloads
get.repository.downloads <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "downloads"))
get.repository.download <- function(owner, repo, id, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "downloads", id))
# creating downloads not supported, because of interaction with S3 and different
# HTTP apis and how it works in enterprise Github setups. I don't want to understand this right now.
delete.repository.download <- function(owner, repo, id, ctx = get.github.context())
  api.delete.request(ctx, c("repos", owner, repo, "downloads", id))

# forks
get.repository.forks <- function(owner, repo, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "forks"), params=list(...))
create.fork <- function(owner, repo, ..., ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "forks"), params=list(...), expect.code=202)

# keys
get.repository.keys <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "keys"))
get.repository.key <- function(owner, repo, id, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "keys", id))
create.repository.key <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "keys"), body=content)
update.repository.key <- function(owner, repo, id, content, ctx = get.github.context())
  api.patch.request(ctx, c("repos", owner, repo, "keys", id), body=content)
delete.repository.key <- function(owner, repo, id, ctx = get.github.context())
  api.delete.request(ctx, c("repos", owner, repo, "keys", id))

# hooks
get.repository.hooks <- function(owner, repo, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "hooks"))
get.repository.hook <- function(owner, repo, id, ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "hooks", id))
create.hook <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "hooks"), body=content)
update.hook <- function(owner, repo, id, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "hooks", id), body=content)
test.hook <- function(owner, repo, id, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "hooks", id, "tests"))
delete.hook <- function(owner, repo, id, ctx = get.github.context())
  api.delete.request(ctx, c("repos", owner, repo, "hooks", id))
# there's some text about github and pubsubhubbub on the docs. I'm skipping it for now.

# merge
perform.repository.merge <- function(owner, repo, content, ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "merges"), body=content, expect.code=c(201, 204, 409, 404))

# statuses
get.repository.statuses <- function(owner, repo, sha, ..., ctx = get.github.context())
  api.get.request(ctx, c("repos", owner, repo, "statuses", sha), params=list(...))
create.repository.status <- function(owner, repo, sha, ..., ctx = get.github.context())
  api.post.request(ctx, c("repos", owner, repo, "statuses", sha), params=list(...))


