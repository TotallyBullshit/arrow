% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xProdSetOf}
\alias{xProdSetOf}
\alias{xProdSetOf_}
\title{xProdSetOf}
\usage{
xProdSetOf(colls)

xProdSetOf_(...)
}
\arguments{
\item{colls}{a collection of collections. The collections to
use to take the cartesian product.}

\item{...}{see above.}
}
\value{
A list of collections, with as many elements per collection as
     there are collections in \bold{colls}.
}
\description{
Get the cartesian product of several collections.
}
\section{Type Signature}{

    ||any|| -> [[any]]
}

\section{Corner Cases}{

     Returns the empty list if \bold{colls} is length-zero.
}
\examples{

# 1. xProdSetOf with xMap, xMapply or xReduce are
#    generally very nice replacements for loops.

xMapply(
    (ith : jth) := {
        ith^2 + jth^2
    },
    xProdSetOf_(1:4, 1:4)
)

# is roughly the same as base R's_

res <- list()

for (ith in 1:4) {
    for (jth in 1:4) {
        res <- c(res, ith^2 + jth^2)
    }
}

res

# 2. Compute the standard childhood multiplication
#    table.

xProdSetOf_(1:12, 1:12)
}
\seealso{
Other combinatoric_functions: \code{\link{xChoose}},
  \code{\link{xChoose_}}; \code{\link{xCycle}},
  \code{\link{xCycle_}}; \code{\link{xPowerSetOf}},
  \code{\link{xPowerSetOf_}}; \code{\link{xReorder}},
  \code{\link{xReorder_}}

Other set_functions: \code{\link{xDuplicatesOf}},
  \code{\link{xDuplicatesOf_}}; \code{\link{xInter}},
  \code{\link{xInter_}}; \code{\link{xIsMember}},
  \code{\link{xIsMember_}}; \code{\link{xIsSubset}},
  \code{\link{xIsSubset_}}; \code{\link{xNotMember}},
  \code{\link{xNotMember_}}; \code{\link{xNotSubset}},
  \code{\link{xNotSubset_}}; \code{\link{xPowerSetOf}},
  \code{\link{xPowerSetOf_}}; \code{\link{xReorder}},
  \code{\link{xReorder_}}; \code{\link{xUnionOf}},
  \code{\link{xUnionOf_}}; \code{\link{xUniqueOf}},
  \code{\link{xUniqueOf_}}
}

