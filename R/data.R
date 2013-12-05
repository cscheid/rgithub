################################################################################
# blobs

#' get a blob
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param sha the SHA of the blob
#'
#' @param ctx the github context object
#'
#' @return the blob
get.blob <- function(owner, repo, sha, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "git", "blobs", sha))

#' create a blob
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object describing the blob. See http://developer.github.com/v3/git/blobs/#create-a-blob for details.
#'
#' @param ctx the github context object
#'
#' @return the blob
create.blob <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "git", "blobs"), body=content)

################################################################################
# commits

#' get a commit
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param sha the SHA of the blob
#'
#' @param ctx the github context object
#'
#' @return the commit
get.commit <- function(owner, repo, sha, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "git", "commits", sha))

#' create a commit
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object describing the content. See 
#'
#' @param ctx the github context object
#'
#' @return the commit
create.commit <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "git", "commits", params=content))

################################################################################
# references

#' get a git reference
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param ref the git reference
#'
#' @param ctx the github context object
#'
#' @return the reference
get.reference <- function(owner, repo, ref, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "git", "refs", ref))

#' get all references (or subreferences)
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param subnamespace the subnamespace
#'
#' @param ctx the github context object
#'
#' @return the list of references
get.all.references <- function(owner, repo, subnamespace=NULL, ctx = get.github.context()) {
  if (is.null(subnamespace))
    .api.get.request(ctx, c("repos", owner, repo, "git", "refs"))
  else
    .api.get.request(ctx, c("repos", owner, repo, "git", "refs", subnamespace))
}

#' create a reference
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object describing the reference. See http://developer.github.com/v3/git/refs/#create-a-reference for details.
#'
#' @param ctx the github context object
#'
#' @return the created reference
create.reference <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "git", "refs"), body=content)

#' edit a reference
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param ref the reference
#'
#' @param content the JSON object describing the reference. See http://developer.github.com/v3/git/refs/#update-a-reference for details.
#'
#' @param ctx the github context object
#'
#' @return the created reference
modify.reference <- function(owner, repo, ref, content, ctx = get.github.context())
  .api.patch.request(ctx, c("repos", owner, repo, "git", "refs", ref), body=content)

#' delete a reference
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param ref the reference
#'
#' @param ctx the github context object
#'
#' @return none
delete.reference <- function(owner, repo, ref, ctx = get.github.context())
  .api.delete.request(ctx, c("repos", owner, repo, "git", "refs", ref))

################################################################################
# tags

#' get a tag
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param sha the SHA of the tag
#'
#' @param ctx the github context object
#'
#' @return the tag
get.tag <- function(owner, repo, sha, ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "git", "tags", sha))

#' create a tag
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object describing the content. See http://developer.github.com/v3/git/tags/#create-a-tag-object for details.
#'
#' @param ctx the github context object
#'
#' @return the tag
create.tag <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "git", "tags"), params=content)

################################################################################
# trees

#' get a tree
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param sha the SHA of the tree
#'
#' @param ... extra parameters. if recursive=1, then directories are traversed recursively
#'
#' @param ctx the github context object
#'
#' @return the tree contents
get.tree <- function(owner, repo, sha, ..., ctx = get.github.context())
  .api.get.request(ctx, c("repos", owner, repo, "git", "trees", sha), params=list(...))

#' get a tree
#'
#' @param owner the repo owner
#'
#' @param repo the name of the repo
#'
#' @param content the JSON object describing the tree. See http://developer.github.com/v3/git/trees/#create-a-tree for details.
#'
#' @param ctx the github context object
#'
#' @return the tree contents
create.tree <- function(owner, repo, content, ctx = get.github.context())
  .api.post.request(ctx, c("repos", owner, repo, "git", "trees"), body=content)


