get.my.repositories <- api.function(function(ctx, ...)
  api.get.request(ctx, c("user", "repos"), params=.rest(...)))
get.user.repositories <- api.function(function(ctx, user, ...)
  api.get.request(ctx, c("users", user, "repos"), params=.rest(...)))
get.organization.repositories <- api.function(function(ctx, org, ...)
  api.get.request(ctx, c("orgs", org, "repos"), params=.rest(...)))
get.all.repositories <- api.function(function(ctx, ...)
  api.get.request(ctx, c("repositories"), params=.rest(...)))
create.repository <- api.function(function(ctx, ...)
  api.post.request(ctx, c("user", "repos"), body=content))
create.organization.repository <- api.function(function(ctx, org, ...)
  api.post.request(ctx, c("orgs", org, "repos"), body=content))
get.repository <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo)))
update.repository <- api.function(function(ctx, owner, repo, content)
  api.patch.request(ctx, c("repos", owner, repo), body=content))
get.repository.contributors <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "contributors")))
get.repository.languages <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "languages")))
get.repository.teams <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "teams")))
get.repository.tags <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "tags")))
get.repository.branches <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "branches")))
get.repository.branch <- api.function(function(ctx, owner, repo, branch)
  api.get.request(ctx, c("repos", owner, repo, "branches", branch)))
delete.repository <- api.function(function(ctx, owner, repo)
  api.delete.request(ctx, c("repos", owner, repo)))

# collaborators
get.repository.collaborators <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "collaborators")))
is.repository.collaborator <- api.function(function(ctx, owner, repo, user)
  api.test.request(ctx, c("repos", owner, repo, "collaborators", user)))
add.repository.collaborator <- api.function(function(ctx, owner, repo, user)
  api.put.request(ctx, c("repos", owner, repo, "collaborators", user), expect.code=204))
delete.repository.collaborator <- api.function(function(ctx, owner, repo, user)
  api.delete.request(ctx, c("repos", owner, repo, "collaborators", user)))

# comments
get.repository.comments <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "comments")))
get.repository.commit.comments <- api.function(function(ctx, owner, repo, sha)
  api.get.request(ctx, c("repos", owner, repo, "commits", sha, "comments")))
create.commit.comment <- api.function(function(ctx, owner, repo, sha, content)
  api.post.request(ctx, c("repos", owner, repo, "commits", sha, "comments"), body=content))
get.commit.comment <- api.function(function(ctx, owner, repo, id)
  api.get.request(ctx, c("repos", owner, repo, "comments", id)))
update.commit.comment <- api.function(function(ctx, owner, repo, id, content)
  api.patch.request(ctx, c("repos", owner, repo, "comments", id), body=content))
delete.commit.comment <- api.function(function(ctx, owner, repo, id)
  api.delete.request(ctx, c("repos", owner, repo, "comments", id)))

# commits
get.repository.commits <- api.function(function(ctx, owner, repo, ...)
  api.get.request(ctx, c("repos", owner, repo, "commits"), params=.rest(...)))
get.repository.commit <- api.function(function(ctx, owner, repo, sha)
  api.get.request(ctx, c("repos", owner, repo, "commits", sha)))
get.repository.diff <- api.function(function(ctx, owner, repo, sha1, sha2)
  api.get.request(ctx, c("repos", owner, repo, "compare", str_c(sha1, "...", sha2))))

# contents
get.repository.readme <- api.function(function(ctx, owner, repo, ...)
  api.get.request(ctx, c("repos", owner, repo, "readme"), params=.rest(...)))
get.repository.path <- api.function(function(ctx, owner, repo, path, ...)
  api.get.request(ctx, c("repos", owner, repo, "contents", path), params=.rest(...)))
get.repository.tarball <- api.function(function(ctx, owner, repo, ref, ...)
  api.get.request(ctx, c("repos", owner, repo, "tarball", ref), params=.rest(...)))
get.repository.zipball <- api.function(function(ctx, owner, repo, ref, ...)
  api.get.request(ctx, c("repos", owner, repo, "zipball", ref), params=.rest(...)))

# downloads
get.repository.downloads <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "downloads")))
get.repository.download <- api.function(function(ctx, owner, repo, id)
  api.get.request(ctx, c("repos", owner, repo, "downloads", id)))
# creating downloads not supported, because of interaction with S3 and different
# HTTP apis and how it works in enterprise Github setups. I don't want to understand this right now.
delete.repository.download <- api.function(function(ctx, owner, repo, id)
  api.delete.request(ctx, c("repos", owner, repo, "downloads", id)))

# forks
get.repository.forks <- api.function(function(ctx, owner, repo, ...)
  api.get.request(ctx, c("repos", owner, repo, "forks"), params=.rest(...)))
create.fork <- api.function(function(ctx, owner, repo, ...)
  api.post.request(ctx, c("repos", owner, repo, "forks"), params=.rest(...), expect.code=202))

# keys
get.repository.keys <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "keys")))
get.repository.key <- api.function(function(ctx, owner, repo, id)
  api.get.request(ctx, c("repos", owner, repo, "keys", id)))
create.repository.key <- api.function(function(ctx, owner, repo, content)
  api.post.request(ctx, c("repos", owner, repo, "keys"), body=content))
update.repository.key <- api.function(function(ctx, owner, repo, id, content)
  api.patch.request(ctx, c("repos", owner, repo, "keys", id), body=content))
delete.repository.key <- api.function(function(ctx, owner, repo, id)
  api.delete.request(ctx, c("repos", owner, repo, "keys", id)))

# hooks
get.repository.hooks <- api.function(function(ctx, owner, repo)
  api.get.request(ctx, c("repos", owner, repo, "hooks")))
get.repository.hook <- api.function(function(ctx, owner, repo, id)
  api.get.request(ctx, c("repos", owner, repo, "hooks", id)))
create.hook <- api.function(function(ctx, owner, repo, content)
  api.post.request(ctx, c("repos", owner, repo, "hooks"), body=content))
update.hook <- api.function(function(ctx, owner, repo, id, content)
  api.post.request(ctx, c("repos", owner, repo, "hooks", id), body=content))
test.hook <- api.function(function(ctx, owner, repo, id)
  api.post.request(ctx, c("repos", owner, repo, "hooks", id, "tests")))
delete.hook <- api.function(function(ctx, owner, repo, id)
  api.delete.request(ctx, c("repos", owner, repo, "hooks", id)))
# there's some text about github and pubsubhubbub on the docs. I'm skipping it for now.

# merge
perform.repository.merge <- api.function(function(ctx, owner, repo, content)
  api.post.request(ctx, c("repos", owner, repo, "merges"), body=content, expect.code=c(201, 204, 409, 404)))

# statuses
get.repository.statuses <- api.function(function(ctx, owner, repo, sha, ...)
  api.get.request(ctx, c("repos", owner, repo, "statuses", sha), params=.rest(...)))
create.repository.status <- api.function(function(ctx, owner, repo, sha, ...)
  api.post.request(ctx, c("repos", owner, repo, "statuses", sha), params=.rest(...)))


