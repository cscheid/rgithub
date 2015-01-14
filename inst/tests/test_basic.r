context("Basic Tests")

test_that("A basic rgithub context can be acquired", {
	create.github.context("https://api.github.com")
	repos <- get.user.repositories("cscheid")
	repos_overview <- do.call("rbind",
														lapply(repos$content[1:5], function(x) {
															data.frame(name = x$name,
																				 owner = x$owner$login,
																				 updated_at = x$updated_at)}))
	cat("\n")
	print(repos_overview)
})
