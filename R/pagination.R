#' @export
next.page <- function(response, ..., ctx = get.github.context()) {
  links <- .parse_links(response)
  if (is.null(links[["next"]])) {
    warning("No more pages.", call. = FALSE)
    return(NULL)
  }

  params <- response$params
  params$page <- .parse_page_from_link(links[["next"]])

  if (is.null(params$page)) {
    stop("Could not find next page from url ", links[["next"]],
         call. = FALSE)
  }

  .api.request(ctx = ctx, req = response$req, method = response$method,
               params = params, ...)
}

.parse_links <- function(response) {
  regex <- "[<]([^>]+)[>]; rel=\"([^\"]+)\""
  raw_links <- response$headers$link
  if (is.null(raw_links)) return(NULL)
  link_matches <- str_match_all(raw_links, regex)[[1]][,1]
  urls <- str_replace(link_matches, regex, "\\1")
  targets <- str_replace(link_matches, regex, "\\2")
  names(urls) <- targets
  as.list(urls)
}

.parse_page_from_link <- function(url) {
  parse_url(url)$query$page
}
