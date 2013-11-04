context("Basic Tests")

test_that("A basic rgithub context can be acquired", {
  ctx <- create.github.context("https://api.github.com")
  repos <- get.user.repositories("cscheid", ctx = ctx)
  print(repos)
})
