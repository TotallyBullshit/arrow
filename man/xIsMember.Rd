% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xIsMember}
\alias{xIsMember}
\alias{xIsMember_}
\title{xIsMember}
\usage{
xIsMember(val, coll)

xIsMember_(val, ...)
}
\arguments{
\item{val}{an arbitrary value. The value to test for membership
   in \bold{coll}.}

\item{coll}{a collection. The collection of elements to check against
   \bold{val}.}

\item{...}{see above.}
}
\value{
A boolean value.
}
\description{
Check if a collection contains a value.
}
\section{Type Signature}{

    any -> |any| -> &lt;logical>
}

\section{Corner Cases}{

   Various types of \bold{Na} are not-distinguished between.
   Type conversion is not carried out.
}
\examples{

NULL

}
\seealso{
Other set_functions: \code{\link{xDuplicatesOf}},
  \code{\link{xDuplicatesOf_}}; \code{\link{xInter}},
  \code{\link{xInter_}}; \code{\link{xIsSubset}},
  \code{\link{xIsSubset_}}; \code{\link{xNotMember}},
  \code{\link{xNotMember_}}; \code{\link{xNotSubset}},
  \code{\link{xNotSubset_}}; \code{\link{xPowerSetOf}},
  \code{\link{xPowerSetOf_}}; \code{\link{xProdSetOf}},
  \code{\link{xProdSetOf_}}; \code{\link{xReorder}},
  \code{\link{xReorder_}}; \code{\link{xUnionOf}},
  \code{\link{xUnionOf_}}; \code{\link{xUniqueOf}},
  \code{\link{xUniqueOf_}}
}

