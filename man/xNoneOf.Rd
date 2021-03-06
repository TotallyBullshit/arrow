% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xNoneOf}
\alias{xNoneOf}
\alias{xNoneOf_}
\title{xNoneOf}
\usage{
xNoneOf(pred, coll)

xNoneOf_(pred, ...)
}
\arguments{
\item{pred}{a predicate. The function used to test each element of
   the input collection.}

\item{coll}{a collection. The collection to test each element of.}

\item{...}{see above.}
}
\value{
A boolean value.
}
\description{
Is a predicate true for none elements of a collection?
}
\section{Type Signature}{

    (any -> logical) -> |any| -> &lt;boolean>
}

\section{Corner Cases}{

   If coll is length zero then logical(0) is returned. Na is treated as False.
}
\examples{

# 1. Test if none of the elements of a vector are true.

xNoneOf(xI, c(True, False, True))

# False
}
\seealso{
Other quantifier_functions: \code{\link{xAllOf}},
  \code{\link{xAllOf_}}; \code{\link{xAnyOf}},
  \code{\link{xAnyOf_}}; \code{\link{xExists}},
  \code{\link{xExists_}}; \code{\link{xForall}},
  \code{\link{xForall_}}; \code{\link{xPoll}},
  \code{\link{xPoll_}}
}

