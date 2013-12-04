#' Search Github repositories.
#' @template srch
#' @examples \dontrun{
#' search.repositories("tetris language:assembly")
#' }
search.repositories <- function(q, ..., ctx = get.github.context()) {
  params <- list(...)
  params$q <- q
  .api.get.request(ctx, c("search", "repositories"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}

#' Search Github code.
#' @template srch
#' @examples \dontrun{
#' search.code("octokit in:file extension:gemspec -repo:octokit/octokit.rb", sort="indexed")
#' }
search.code <- function(q, ..., ctx = get.github.context()) {
  params <- list(...)
  params$q <- q
  .api.get.request(ctx, c("search", "code"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}

#' Search Github issues.
#' @template srch
#' @examples \dontrun{
#' search.issues("windows label:bug language:python state:open", sort="created", order="asc")
#' }
search.issues <- function(q, ..., ctx = get.github.context()) {
  params <- list(...)
  params$q <- q
  .api.get.request(ctx, c("search", "issues"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}

#' Search Github users.
#' @template srch
#' @examples \dontrun{
#' search.users("tom repos:>42 followers:>1000")
#' }
search.users <- function(q, ..., ctx = get.github.context()) {
  params <- list(...)
  params$q <- q
  .api.get.request(ctx, c("search", "users"), params=params, config=add_headers(Accept="application/vnd.github.preview+json"))
}
