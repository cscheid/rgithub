my.repositories                <- function(ctx, ...)                  api.get.request(ctx, c("user", "repos"), params=.rest(...))
user.repositories              <- function(ctx, user, ...)            api.get.request(ctx, c("users", user, "repos"), params=.rest(...))
organization.repositories      <- function(ctx, org, ...)             api.get.request(ctx, c("orgs", org, "repos"), params=.rest(...))
all.repositories               <- function(ctx, ...)                  api.get.request(ctx, c("repositories"), params=.rest(...))
create.repository              <- function(ctx, ...)                  api.post.request(ctx, c("user", "repos"), body=content)
create.organization.repository <- function(ctx, org, ...)             api.post.request(ctx, c("orgs", org, "repos"), body=content)
repository                     <- function(ctx, owner, repo)          api.get.request(ctx, c("repos", owner, repo))
update.repository              <- function(ctx, owner, repo, content) api.patch.request(ctx, c("repos", owner, repo), body=content)
repository.contributors        <- function(ctx, owner, repo)          api.get.request(ctx, c("repos", owner, repo, "contributors"))
repository.languages           <- function(ctx, owner, repo)          api.get.request(ctx, c("repos", owner, repo, "languages"))
repository.teams               <- function(ctx, owner, repo)          api.get.request(ctx, c("repos", owner, repo, "teams"))
repository.tags                <- function(ctx, owner, repo)          api.get.request(ctx, c("repos", owner, repo, "tags"))
repository.branches            <- function(ctx, owner, repo)          api.get.request(ctx, c("repos", owner, repo, "branches"))
repository.branch              <- function(ctx, owner, repo, branch)  api.get.request(ctx, c("repos", owner, repo, "branches", branch))
delete.repository              <- function(ctx, owner, repo)          api.delete.request(ctx, c("repos", owner, repo))

# collaborators
repository.collaborators       <- function(ctx, owner, repo)       api.get.request(ctx, c("repos", owner, repo, "collaborators"))
is.repository.collaborator     <- function(ctx, owner, repo, user) api.get.request(ctx, c("repos", owner, repo, "collaborators", user), expect.code=c(204, 404))
add.repository.collaborator    <- function(ctx, owner, repo, user) api.put.request(ctx, c("repos", owner, repo, "collaborators", user), expect.code=204)
delete.repository.collaborator <- function(ctx, owner, repo, user) api.delete.request(ctx, c("repos", owner, repo, "collaborators", user))

# comments
repository.comments        <- function(ctx, owner, repo)               api.get.request(ctx, c("repos", owner, repo, "comments"))
repository.commit.comments <- function(ctx, owner, repo, sha)          api.get.request(ctx, c("repos", owner, repo, "commits", sha, "comments"))
create.commit.comment      <- function(ctx, owner, repo, sha, content) api.post.request(ctx, c("repos", owner, repo, "commits", sha, "comments"), body=content)
commit.comment             <- function(ctx, owner, repo, id)           api.get.request(ctx, c("repos", owner, repo, "comments", id))
update.commit.comment      <- function(ctx, owner, repo, id, content)  api.patch.request(ctx, c("repos", owner, repo, "comments", id), body=content)
delete.commit.comment      <- function(ctx, owner, repo, id)           api.delete.request(ctx, c("repos", owner, repo, "comments", id))

# commits
repository.commits <- function(ctx, owner, repo, ...)        api.get.request(ctx, c("repos", owner, repo, "commits"), params=.rest(...))
repository.commit  <- function(ctx, owner, repo, sha)        api.get.request(ctx, c("repos", owner, repo, "commits", sha))
repository.diff    <- function(ctx, owner, repo, sha1, sha2) api.get.request(ctx, c("repos", owner, repo, "compare", str_c(sha1, "...", sha2)))

# contents
repository.readme  <- function(ctx, owner, repo, ...)       api.get.request(ctx, c("repos", owner, repo, "readme"), params=.rest(...))
repository.path    <- function(ctx, owner, repo, path, ...) api.get.request(ctx, c("repos", owner, repo, "contents", path), params=.rest(...))
repository.tarball <- function(ctx, owner, repo, ref, ...)  api.get.request(ctx, c("repos", owner, repo, "tarball", ref), params=.rest(...))
repository.zipball <- function(ctx, owner, repo, ref, ...)  api.get.request(ctx, c("repos", owner, repo, "zipball", ref), params=.rest(...))

# downloads
repository.downloads       <- function(ctx, owner, repo)      api.get.request(ctx, c("repos", owner, repo, "downloads"))
repository.download        <-  function(ctx, owner, repo, id) api.get.request(ctx, c("repos", owner, repo, "downloads", id))
# creating downloads not supported, because of interaction with S3 and different
# HTTP apis I don't want to understand right now.
delete.repository.download <- function(ctx, owner, repo, id)  api.delete.request(ctx, c("repos", owner, repo, "downloads", id))

# forks
repository.forks <- function(ctx, owner, repo, ...) api.get.request(ctx, c("repos", owner, repo, "forks"), params=.rest(...))
create.fork      <- function(ctx, owner, repo, ...) api.post.request(ctx, c("repos", owner, repo, "forks"), params=.rest(...), expect.code=202)

# keys
repository.keys       <- function(ctx, owner, repo)              api.get.request(ctx, c("repos", owner, repo, "keys"))
repository.key        <- function(ctx, owner, repo, id)          api.get.request(ctx, c("repos", owner, repo, "keys", id))
create.repository.key <- function(ctx, owner, repo, content)     api.post.request(ctx, c("repos", owner, repo, "keys"), body=content)
update.repository.key <- function(ctx, owner, repo, id, content) api.patch.request(ctx, c("repos", owner, repo, "keys", id), body=content)
delete.repository.key <- function(ctx, owner, repo, id)          api.delete.request(ctx, c("repos", owner, repo, "keys", id))

# hooks
repository.hooks <- function(ctx, owner, repo) api.get.request(ctx, c("repos", owner, repo, "hooks"))
repository.hook <- function(ctx, owner, repo, id) api.get.request(ctx, c("repos", owner, repo, "hooks", id))
create.hook <- function(ctx, owner, repo, content) api.post.request(ctx, c("repos", owner, repo, "hooks"), body=content)
update.hook <- function(ctx, owner, repo, id, content) api.post.request(ctx, c("repos", owner, repo, "hooks", id), body=content)
test.hook <- function(ctx, owner, repo, id) api.post.request(ctx, c("repos", owner, repo, "hooks", id, "tests"))
delete.hook <- function(ctx, owner, repo, id) api.delete.request(ctx, c("repos", owner, repo, "hooks", id))
# there's some text about github and pubsubhubbub on the docs. I'm skipping it for now.

# merge
perform.repository.merge <- function(ctx, owner, repo, content) api.post.request(ctx, c("repos", owner, repo, "merges"), body=content, expect.code=c(201, 204, 409, 404))

# statuses
repository.statuses <- function(ctx, owner, repo, sha, ...) api.get.request(ctx, c("repos", owner, repo, "statuses", sha), params=.rest(...))
create.repository.status <- function(ctx, owner, repo, sha, ...) api.post.request(ctx, c("repos", owner, repo, "statuses", sha), params=.rest(...))


