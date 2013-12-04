context("Basic Tests")

test_that("A basic rgithub context can be acquired", {
  create.github.context("https://api.github.com")
  repos <- get.user.repositories("cscheid")
  print(repos)
})
