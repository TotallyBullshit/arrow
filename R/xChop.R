
#' xChop
#'
#' Divide a collection into a fixed number of segments.
#'
#' @section Type Signature:
#'     |numeric| -> |any| -> [[any]]
#'
#' @details
#'     \bold{xChop} is used to divide a collection into several
#'     segments. This differs from \bold{xChunk} in that \bold{xChop}
#'     creates a fixed number of segments or arbitrary size, while
#'     \bold{xChunk} creates segments of fixed size, but not a fixed
#'     number of such segments.
#'
#'     \code{xChop(2, 1:5)}
#'
#'     \code{list(list(1, 2, 3), list(4, 5))}
#'
#'     \bold{xChop} can be used for dividing a task for parallel execution.
#'     For example, a very large collection could be chopped into
#'     four subcollections by using \bold{xChop(4, coll)}, before applying a
#'     function to each sublist using \bold{mclapply( )}.
#'
#' @param
#'    num a nonnegative whole number. The desired number
#'    of output collections to generate.
#'
#' @param
#'    coll a collection. The collection to chop up.
#'
#' @param
#'    ... see above.
#'
#' @return
#'    A list of lists.
#'
#' @section Corner Cases:
#'    The final sublist returned by \bold{xChop} may have less elements
#'    than the other sublists, depending on whether or not the length of \bold{coll}
#'    is evenly divisible by \bold{num}. If \bold{coll} is length-zero,
#'    the empty list is returned.
#'
#' @family reshaping_functions
#'
#' @template
#'    Variadic
#'
#' @example
#'    inst/examples/example-xChop.R
#'
#' @rdname xChop
#' @export

xChop <- MakeFun(function (num, coll) {

	MACRO( Must $ Not_Be_Missing(num) )
	MACRO( Must $ Not_Be_Missing(coll) )

	MACRO( Must $ Be_Collection(num) )
	MACRO( Must $ Be_Collection(coll) )

	num <- unit_to_value(as_atom(num, 'numeric'))

	MACRO( Must $ Be_Between(num, 1, Inf))
	MACRO( Must $ Be_Whole(num) )

	if (length(coll) == 0) {
		list()
	} else if (is.infinite(num)) {
		as.list(coll)
	} else {

		ith <- current <-1
		average_elems <- ceiling(length(coll) / num)

		chopped <- list()

		while (current <= length(coll)) {

			to_select <- min(length(coll), (current + average_elems - 1))

			chopped[[ith]] <-
				as.list(coll[current : to_select])

			ith <- ith + 1
			current <- current + average_elems
		}

		chopped
	}
})

#' @rdname xChop
#' @export

xChop_ <- MakeVariadic(xChop, 'coll')
