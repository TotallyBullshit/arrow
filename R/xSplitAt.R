
#' xSplitAt
#'
#' Split a collection into elements before and upto
#' an index, and after that index.
#'
#' @param
#'    num a nonnegative whole number.
#'
#' @param
#'    coll a collection
#'
#' @param
#'    ... see above.
#'
#' @return a list of two lists; the first list containing
#'    the first \code{num} elements of \code{coll}, and the
#'    second list containing the remaining elements \code{coll}.
#'
#' @section Corner Cases:
#'    If \code{num} is zero then the first list in the
#'    returned value is empty.
#'    Likewise, if \code{num} is equal or larger than the
#'    length of \code{coll} then
#'    the second return list is empty. If \code{coll} is
#'    length zero both lists are empty.
#'
#' @family reshaping_functions
#'
#' @template
#'    Variadic
#'
#' @rdname xSplitAt
#' @export

xSplitAt <- function (num, coll) {
	# number -> Collection any -> [[any], [any]]
	# take the first n values of collection.

	invoking_call <- sys.call()

	assert(
		!missing(num), invoking_call,
		exclaim$parametre_missing(num))

	assert(
		!missing(coll), invoking_call,
		exclaim$parametre_missing(coll))

	num <- as_typed_vector(num, "numeric", True)

	assert(
		length(num) == 1,
		exclaim$must_have_length(
			num, 1, summate(num)) )

	assert(
		is_collection(coll), invoking_call,
		exclaim$must_be_collection(
			coll, summate(coll)) )

	if (length(coll) == 0) {
		list()
	} else {
		list(
			as.list(coll)[seq_len( min(num, length(coll)) )],
			if (num < length(coll)) {
				as.list(coll)[(num + 1) : length(coll)]
			} else {
				list()
			}
		)
	}
}

#' @rdname xSplitAt
#' @export

xSplitAt... <- function (num, ...) {
	xSplitAt(num, list(...))
}