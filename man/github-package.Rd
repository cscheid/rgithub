\name{github-package}
\alias{github-package}
\alias{github}
\docType{package}
\title{
Use the Github API from R
~~ package title ~~
}
\description{
This package wraps the Github web service API so you can make R calls
against the Github API (to get information about repositories, or even
to create new content)
~~ A concise (1-5 lines) description of the package ~~
}
\details{
\tabular{ll}{
Package: \tab github\cr
Type: \tab Package\cr
Version: \tab 0.9.5\cr
Date: \tab 2013-02-28\cr
License: \tab MIT\cr
}
~~ An overview of how to use the package, including the most important functions ~~
}
\author{
Carlos Scheidegger

Maintainer: Carlos Scheidegger <carlos.scheidegger@gmail.com>
}
\references{
~~ Literature or other references for background information ~~
}
\keyword{ package }
\seealso{ RJSON }
\examples{
repos <- get.user.repositories("cscheid")
}
