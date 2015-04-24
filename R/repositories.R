################################################################################
# General repo information

#' Get list of repositories of current user
#'
#' @param ... extra parameters, see http://developer.github.com/v3/repos/
#'
#' @param ctx the github context object
#'
#' @return list of repositories
get.my.repositories <- function(..., ctx = get.github.context())
  .api.get.request(ctx, c("user", "repos"), params=list(...))

#' Get list of repositories of given user
#'
#' @param user the given user
#'
#' @param ... extra parameters, see http://developer.github.com/v3/repos/
#'
#' @param ctx the github context object
#'
#' @return list of repositories
get.user.repositories <- function(user, ..., ctx = get.github.context())
  .api.get.request(ctx, c("users", user, "repos"), params=list(...))

#' get list of repositories of given organization
#'
#' @param org the given organization
#'
#' @param ... extra parameters, see http://developer.github.com/v3/repos/
#'
#' @param ctx the github context object
#'
#' @return list of repositories
get.organization.repositories <- function(org, ..., ctx = get.github.context())
  .api.get.request(ctx, c("orgs", org, "repos"), params=list(...))

#' get list of all repositories
#'
#' @param ... extra parameters, use "since=id" for pagination
#'
#' @param ctx the github context object
#'
#' @return list of repositories
get.all.repositories <- function(..., ctx = get.github.context())
  .api.get.request(ctx, c("repositories"), params=list(...))

#' create repository
#'
#' @param ... parameters, "name=repo_name" is required, see
#'   http://developer.github.com/v3/repos/#create for more
#'
#' @param ctx the github context object
#'
#' @return the created repository

create.repository <- function (..., ctx = get.github.context()) 
  .api.post.request(ctx, c("user", "repos"), body = list(...))

#' create rpository under given organization
#'
#' @param org the given organization
#'
#' @param ... parameters, "name=repo_name" is required, see
#'   http://developer.github.com/v3/repos/#create for more
#'
#' @param ctx the github context object
#'
#' @return the created repository
create.organization.repository <- function(org, ..., ctx = get.github.context())
  .api.post.request(ctx, c("orgs", org, "repos"), body=list(...))

#' get repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return the repository
get.repository <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo))

#' modify repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param content the changes to be made, see http://developer.github.com/v3/repos/#edit
#'
#' @param ctx the github context object
#'
#' @return the changed repository
modify.repository <- function(owner, repo, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo), body=content)

#' get list of repository contributors
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of repo contributors
get.repository.contributors <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "contributors"))

#' get stats on repository contributors
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of repo contributors stats
get.repository.contributors.stats <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "stats", "contributors"))

#' get list of languages used in the repository, as estimated by github
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of languages
get.repository.languages <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "languages"))

#' get list of teams participating in the repository
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of teams
get.repository.teams <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "teams"))

#' get list of repository tags
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of tags
get.repository.tags <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "tags"))

#' get list of repository branches
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of branches
get.repository.branches <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "branches"))

#' get specific repository branch
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param branch the name of the branch
#'
#' @param ctx the github context object
#'
#' @return information about the branch
get.repository.branch <- function(owner, repo, branch, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "branches", branch))

#' delete repository
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return nothing
delete.repository <- function(owner, repo, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo))

################################################################################
# collaborators

#' get list of collaborators of a repo
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of collaborators
get.repository.collaborators <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "collaborators"))

#' test if a given user is a collaborator of a repo
#' 
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param user the name of the user to test
#'
#' @param ctx the github context object
#'
#' @return TRUE if user is a collaborator in the repo
is.repository.collaborator <- function(owner, repo, user, ctx = get.github.context())
  .api.test.request(ctx, c("repos", owner, repo, "collaborators", user))

#' add a user to the list of collaborators of a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param user the name of the user to add
#'
#' @param ctx the github context object
#'
#' @return none
add.repository.collaborator <- function(owner, repo, user, ctx = get.github.context())
  .api.put.request(ctx, c("repos", owner, repo, "collaborators", user), expect.code=204)

#' delete a user from the list of collaborators of a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param user the name of the user to delete
#'
#' @param ctx the github context object
#'
#' @return none
delete.repository.collaborator <- function(owner, repo, user, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "collaborators", user))

################################################################################
# comments

#' get all commit comments for a repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of comments
get.repository.comments <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "comments"))

#' get all commit comments for a given commit in a repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param sha the SHA hash of the commit
#'
#' @param ctx the github context object
#'
#' @return the comments
get.repository.commit.comments <- function(owner, repo, sha, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "commits", sha, "comments"))

#' create a comment for a given commit in a repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param sha the SHA hash of the commit
#'
#' @param content JSON object describing the comment (see http://developer.github.com/v3/repos/comments/#create-a-commit-comment for details)
#'
#' @param ctx the github context object
#'
#' @return the comment
create.commit.comment <- function(owner, repo, sha, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "commits", sha, "comments"), body=content)

#' get a single commit comment
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the comment id
#'
#' @param ctx the github context object
#'
#' @return the comment
get.commit.comment <- function(owner, repo, id, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "comments", id))

#' update a single commit comment
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the comment id
#'
#' @param content the JSON object containing the new contents of the comment. See http://developer.github.com/v3/repos/comments/#update-a-commit-comment for details.
#'
#' @param ctx the github context object
#'
#' @return the comment
modify.commit.comment <- function(owner, repo, id, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "comments", id), body=content)

#' delete a single commit comment
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the comment id
#'
#' @param ctx the github context object
#'
#' @return none
delete.commit.comment <- function(owner, repo, id, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "comments", id))

################################################################################
# commits

#' get commits from a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters to be passed. see http://developer.github.com/v3/repos/commits/#list-commits-on-a-repository for details
#'
#' @param ctx the github context object
#'
#' @return list of commits
get.repository.commits <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "commits"), params=list(...))

#' get a specific commit from a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param sha the SHA of the commit
#'
#' @param ctx the github context object
#'
#' @return the commit
get.repository.commit <- function(owner, repo, sha, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "commits", sha))

#' return a diff between two commits
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param sha1 the SHA of the commit
#'
#' @param sha2 the SHA of the commit
#'
#' @param ctx the github context object
#'
#' @return the commit
get.repository.diff <- function(owner, repo, sha1, sha2, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "compare", str_c(sha1, "...", sha2)))

################################################################################
# contents

#' Get the README for a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters to be passed. See http://developer.github.com/v3/repos/contents/#get-the-readme for details.
#'
#' @param ctx the github context object
#'
#' @return the readme
get.repository.readme <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "readme"), params=list(...))

#' Get the contents of a file
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param path the file path
#'
#' @param ... extra parameters to be passed. See http://developer.github.com/v3/repos/contents/#get-contents
#'
#' @param ctx the github context object
#'
#' @return the file
get.repository.path <- function(owner, repo, path, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "contents", path), params=list(...))

#' Get the archive of a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param format "tarball" or "zipball"
#'
#' @param ref the git reference (usually "master")
#'
#' @param ctx the github context object
#'
#' @return the archive
get.repository.archive <- function(owner, repo, format, ref, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, format, ref))

################################################################################
# downloads

#' list downloads for a repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return the list of downloads
get.repository.downloads <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "downloads"))

#' get specific download for a repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the dowloand
#'
#' @param ctx the github context object
#'
#' @return the specific downloads
get.repository.download <- function(owner, repo, id, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "downloads", id))
# creating downloads not supported, because of interaction with S3 and different
# HTTP apis and how it works in enterprise Github setups. I don't want to understand this right now.

#' delete specific download for a repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the dowloand
#'
#' @param ctx the github context object
#'
#' @return the specific downloads
delete.repository.download <- function(owner, repo, id, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "downloads", id))

################################################################################
# forks

#' list forks
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters. See http://developer.github.com/v3/repos/forks/#list-forks for details.
#'
#' @param ctx the github context object
#'
#' @return the list of forks
get.repository.forks <- function(owner, repo, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "forks"), params=list(...))

#' create a fork under the current user
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ... extra parameters. See http://developer.github.com/v3/repos/forks/#create-fork for details.
#'
#' @param ctx the github context object
#'
#' @return the new fork. Notice that forks happen asynchronously, so git objects will not be immediately accessible.
create.fork <- function(owner, repo, ..., ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "forks"), params=list(...), expect.code=202)

################################################################################
# keys

#' list all repository keys
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return the key list
get.repository.keys <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "keys"))

#' get a specific repository key
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the key id
#'
#' @param ctx the github context object
#'
#' @return the key
get.repository.key <- function(owner, repo, id, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "keys", id))

#' create a repository key
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object with the content. See http://developer.github.com/v3/repos/keys/#create for details
#'
#' @param ctx the github context object
#'
#' @return the key
create.repository.key <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "keys"), body=content)

#' update a repository key
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the key
#'
#' @param content the JSON object with the content. See http://developer.github.com/v3/repos/keys/#edit for details
#'
#' @param ctx the github context object
#'
#' @return the new key
modify.repository.key <- function(owner, repo, id, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "keys", id), body=content)

#' delete a repository key
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the key
#'
#' @param ctx the github context object
#'
#' @return none
delete.repository.key <- function(owner, repo, id, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "keys", id))

################################################################################
# hooks

#' list hooks of repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ctx the github context object
#'
#' @return list of hooks
get.repository.hooks <- function(owner, repo, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "hooks"))

#' get specific hook of repository
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the hook
#'
#' @param ctx the github context object
#'
#' @return the specific hook
get.repository.hook <- function(owner, repo, id, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "hooks", id))

#' create a new hook for repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object describing the hook. See http://developer.github.com/v3/repos/hooks/#create-a-hook for details.
#'
#' @param ctx the github context object
#'
#' @return the specific hook
create.hook <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "hooks"), body=content)

#' modify an exisitng hook for repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the hook
#'
#' @param content the JSON object describing the hook. See http://developer.github.com/v3/repos/hooks/#edit-a-hook for details.
#'
#' @param ctx the github context object
#'
#' @return the specific hook
modify.hook <- function(owner, repo, id, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "hooks", id), body=content)

#' test a push hook. This will force github to trigger the given hook.
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the hook
#'
#' @param ctx the github context object
#'
#' @return none
test.hook <- function(owner, repo, id, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "hooks", id, "tests"))

#' delete a hook.
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param id the id of the hook
#'
#' @param ctx the github context object
#'
#' @return none
delete.hook <- function(owner, repo, id, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "hooks", id))

################################################################################
# merge

#' perform a merge.
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object describing the merge. See http://developer.github.com/v3/repos/merging/#perform-a-merge for details.
#'
#' @param ctx the github context object
#'
#' @return the resulting merge commit
perform.repository.merge <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "merges"), body=content, expect.code=c(201, 204, 409, 404))

################################################################################
# statuses

#' get statuses for a ref in a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ref Ref to list the statuses from. It can be a SHA, a branch name, or a tag name.
#'
#' @param ctx the github context object
#'
#' @return the list of statuses
get.repository.statuses <- function(owner, repo, ref, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "statuses", ref))

#' create status for a ref in a repo
#'
#' @param owner the repo owner (user, org, etc)
#'
#' @param repo the name of the repo
#'
#' @param ref Ref to list the statuses from. It can be a SHA, a branch name, or a tag name.
#'
#' @param ... parameters that describe the status. see http://developer.github.com/v3/repos/statuses/#create-a-status for details.
#'
#' @param ctx the github context object
#'
#' @return the list of statuses
create.repository.status <- function(owner, repo, ref, ..., ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "statuses", ref), params=list(...))


