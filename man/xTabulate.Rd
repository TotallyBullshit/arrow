% Generated by roxygen2 (4.0.1.99): do not edit by hand
\name{xTabulate}
\alias{xTabulate}
\alias{xTabulate_}
\title{xTabulate}
\usage{
xTabulate(coll)

xTabulate_(...)
}
\arguments{
\item{coll}{a collection. The values to find the frequency of.}

\item{...}{see above.}
}
\value{
A list.
}
\description{
Tabulate a collection into pairs of value:frequency lists.
}
\details{
\bold{xTabulate} is superficially similar to the base
    function \bold{table}: given a collection that may or
    may not contain duplicates, it calculates the frequencies
    of each unique element.

    \code{xTabulate(c('y', 'n', 'y', 'y', 'n'))}

    \code{list(list("y", 3), list("n", 2))}

    The result of the tabulation is unsorted for efficiency;
    if sorting is required \bold{xSortBy} can be used.
}
\section{Type Signature}{

   |any| -> ||any, <number>||
}

\section{Corner Cases}{

   If \bold{coll} is length-zero the empty list is returned.
}
\examples{

#
# a subset of the 1999 Clinton impeachment vote.
# each row of the data represents a candidate;
# the columns the party, perjury vote and obstruction vote respectively.

raw_clinton_vote <- "
	R	Guilty		Guilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	R	Guilty		Guilty
	D	NotGuilty	NotGuilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	D	NotGuilty	NotGuilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	D	NotGuilty	NotGuilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	R	Guilty		Guilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	R	NotGuilty	NotGuilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	R	NotGuilty	NotGuilty
	D	NotGuilty	NotGuilty
	R	Guilty		Guilty
	R	Guilty		Guilty
	D	NotGuilty	NotGuilty"

clinton_vote <-
	x_(raw_clinton_vote) $ xToLines() $ xMap(xToWords) $
	xZip() $ xAddKeys(c('party', 'perjury', 'obstruction'))

# 1.
# Tabulate the overall results for the perjury vote

clinton_vote $ xAtKey('perjury') $ x_Tabulate()

# list( list("Guilty", 12), list("NotGuilty", 14) )

# 2.
# Tabulate the overall results for the obstruction vote

clinton_vote $ xAtKey('obstruction') $ x_Tabulate()

# list( list("Guilty", 12), list("NotGuilty", 14) )

# 3.
# An advanced example;
# get the overall vote within each party.

clinton_vote $ xZip () $ xGroupBy(xFirstOf) $ # -- group by party
xAtCol(2) $ # -- select the groups
xMap(party := {
	# get the perjury and obstruction votes by party.

	list(
		perjury =
			x_(party) $ xAtCol(2) $ xTabulate() $ x_ZipKeys(),
		obstruction =
			x_(party) $ xAtCol(3) $ xTabulate() $ x_ZipKeys()
	)

}) $
x_AddKeys(c('Republican', 'Democrat'))


# list(
#     Republican =
#         list(
#             perjury =
#                 list(Guilty = 12, NotGuilty = 2),
#             obstruction =
#                 list(Guilty = 12, NotGuilty = 2),
#     Democrat =
#         list(
#             perjury =
#                 list(NotGuilty = 12),
#             obstruction =
#                 list(NotGuilty = 12)
#         )
#     )
# )
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
  \code{\link{xSortBy_}}; \code{\link{xSplitAt}},
  \code{\link{xSplitAt_}}; \code{\link{xSplitWith}},
  \code{\link{xSplitWith_}}; \code{\link{xUnzipIndices}},
  \code{\link{xUnzipIndices_}}; \code{\link{xUnzipKeys}},
  \code{\link{xUnzipKeys_}}; \code{\link{xZipKeys}},
  \code{\link{xZipKeys_}}; \code{\link{xZip}},
  \code{\link{xZip_}}
}

