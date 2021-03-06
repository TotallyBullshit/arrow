% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xAddKeys}
\alias{xAddKeys}
\alias{xAddKeys_}
\title{xAddKeys}
\usage{
xAddKeys(strs, coll)

xAddKeys_(strs, ...)
}
\arguments{
\item{strs}{a collection of strings. The names to add to the
   input collection.}

\item{coll}{a collection. The collection to add names to.}
}
\value{
A named list.
}
\description{
Add names to a collection.
}
\details{
\bold{xAddKeys} is similar to the in-place assignment
    function \bold{names<-}, except that it is not an in-place
    assignment function.
}
\section{Type Signature}{

   |character| -> |any| -> [any]
}

\section{Corner Cases}{

   Returns the empty list if \bold{coll} is length-zero. Both
   duplicated and length-zero names are allowed.
}
\examples{

# 1.
#
# Add the keys 'country' and 'age' to each row of a csv.

csv <- "Chad,16.6,Congo,16.5,Yemen,16.4,Mali,16.2,Niger,15.2,Uganda,15.0"

age_by_country <-
	x_(csv) $ xExplode(',') $
	xChunk(2) $ xMapply((key : value) := {
		list(key, as.numeric(value))
	}) $
	x_Map(row := {
		xAddKeys(c('country', 'age'), row)
	})

#
# list(
#     list(country = 'Chad',   age = 16.6),
#     list(country = 'Congo',  age = 16.5),
#     list(country = 'Yemen',  age = 16.4),
#     list(country = 'Mali',   age = 16.2),
#     list(country = 'Niger',  age = 15.2),
#     list(country = 'Uganda', age = 15.0)
# )
#
}
\seealso{
Other key_functions: \code{\link{xPluck}},
  \code{\link{xPluck_}}; \code{\link{xUnzipIndices}},
  \code{\link{xUnzipIndices_}}; \code{\link{xUnzipKeys}},
  \code{\link{xUnzipKeys_}}; \code{\link{xZipKeys}},
  \code{\link{xZipKeys_}}

Other key_functions: \code{\link{xPluck}},
  \code{\link{xPluck_}}; \code{\link{xUnzipIndices}},
  \code{\link{xUnzipIndices_}}; \code{\link{xUnzipKeys}},
  \code{\link{xUnzipKeys_}}; \code{\link{xZipKeys}},
  \code{\link{xZipKeys_}}
}

