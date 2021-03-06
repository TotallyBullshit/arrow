% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xSplitAt}
\alias{xSplitAt}
\alias{xSplitAt_}
\title{xSplitAt}
\usage{
xSplitAt(nums, coll)

xSplitAt_(nums, ...)
}
\arguments{
\item{nums}{a vector of nonnegative whole numbers. The indices
   to split a collection \bold{after}.}

\item{coll}{a collection. The collection to split.}

\item{...}{see above.}
}
\value{
A list of lists.
}
\description{
Split a collection into at several indices.
}
\section{Corner Cases}{

   If \code{nums} is zero then the first list in the
   returned value is empty.
   Likewise, if \code{nums} is equal or larger than the
   length of \bold{coll} then
   the second return list is empty. If \bold{coll} is
   length zero both lists are empty.
}
\examples{

NULL

}
\seealso{
Other reshaping_functions: \code{\link{xChop}},
  \code{\link{xChop_}}; \code{\link{xChunk}},
  \code{\link{xChunk_}}; \code{\link{xFlatten}},
  \code{\link{xFlatten_}}; \code{\link{xGroupBy}},
  \code{\link{xGroupBy_}}; \code{\link{xJoin}},
  \code{\link{xJoin_}}; \code{\link{xOneOf}},
  \code{\link{xOneOf_}}; \code{\link{xRecycle}},
  \code{\link{xRecycle_}}; \code{\link{xRepeat}},
  \code{\link{xRepeat_}}; \code{\link{xReverse}},
  \code{\link{xReverse_}}; \code{\link{xShuffle}},
  \code{\link{xShuffle_}}; \code{\link{xSortBy}},
  \code{\link{xSortBy_}}; \code{\link{xSplitWith}},
  \code{\link{xSplitWith_}}; \code{\link{xTabulate}},
  \code{\link{xTabulate_}}; \code{\link{xUnzipIndices}},
  \code{\link{xUnzipIndices_}}; \code{\link{xUnzipKeys}},
  \code{\link{xUnzipKeys_}}; \code{\link{xZipKeys}},
  \code{\link{xZipKeys_}}; \code{\link{xZip}},
  \code{\link{xZip_}}
}

