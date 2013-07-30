#' Search Github repositories.
#' @template srch
#' @examples \dontrun{
#' search.repositories(ctx, "tetris language:assembly")
#' }
search.repositories <- function(ctx, q, ...) {
  params <- .rest(...)
  params$q <- q
  api.get.request(ctx, c("search", "repositories"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}

#' Search Github code.
#' @template srch
#' @examples \dontrun{
#' search.code(ctx, "octokit in:file extension:gemspec -repo:octokit/octokit.rb", sort="indexed")
#' }
search.code <- function(ctx, q, ...) {
  params <- .rest(...)
  params$q <- q
  api.get.request(ctx, c("search", "code"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}

#' Search Github issues.
#' @template srch
#' @examples \dontrun{
#' search.issues(ctx, "windows label:bug language:python state:open", sort="created", order="asc")
#' }
search.issues <- function(ctx, q, ...) {
  params <- .rest(...)
  params$q <- q
  api.get.request(ctx, c("search", "issues"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}

#' Search Github users.
#' @template srch
#' @examples \dontrun{
#' search.users(ctx, "tom repos:>42 followers:>1000")
#' }
search.users <- function(ctx, q, ...) {
  params <- .rest(...)
  params$q <- q
  api.get.request(ctx, c("search", "users"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}
