% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xNotSubset}
\alias{xNotSubset}
\alias{xNotSubset_}
\title{xNotSubset}
\usage{
xNotSubset(coll1, coll2)

xNotSubset_(coll1, ...)
}
\arguments{
\item{coll1}{a collection. The set to test for non-membership in a superset.}

\item{coll2}{a collection. The superset to test.}

\item{...}{see above.}
}
\value{
A boolean value.
}
\description{
Test if a collection is not a subset of a second collection.
}
\section{Type Signature}{

    |any| -> |any| -> &lt;logical>
}

\section{Corner Cases}{

   Returns logical(0) if \bold{coll1} or \bold{coll2} is length-zero.
}
\examples{

NULL
}
\seealso{
Other set_functions: \code{\link{xDuplicatesOf}},
  \code{\link{xDuplicatesOf_}}; \code{\link{xInter}},
  \code{\link{xInter_}}; \code{\link{xIsMember}},
  \code{\link{xIsMember_}}; \code{\link{xIsSubset}},
  \code{\link{xIsSubset_}}; \code{\link{xNotMember}},
  \code{\link{xNotMember_}}; \code{\link{xPowerSetOf}},
  \code{\link{xPowerSetOf_}}; \code{\link{xProdSetOf}},
  \code{\link{xProdSetOf_}}; \code{\link{xReorder}},
  \code{\link{xReorder_}}; \code{\link{xUnionOf}},
  \code{\link{xUnionOf_}}; \code{\link{xUniqueOf}},
  \code{\link{xUniqueOf_}}
}

