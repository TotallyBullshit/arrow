
#' xRankOf
#'
#' Rank a collection of numbers from largest to smallest.
#'
#' @param
#'    nums a vector of numbers. The numbers to rank
#'    in order of size.
#'
#' @param
#'    ... see above.
#'
#' @return
#'    A vector of numbers.
#'
#' @section Corner Cases:
#'    If nums is empty then \bold{integer(0)} is returned. Tied values are
#'    ranked in order of appearance; the first occurrence is ranked lower than
#'    the second occurrence.
#'
#' @template
#'    Variadic
#'
#' @example
#'    inst/examples/example-xRankOf.R
#'
#' @rdname xRankOf
#' @export

xRankOf <- function (nums) {
	# Collection numbers -> Vector numbers
	# Rank numbers in order of size.

	invoking_call <- sys.call()

	insist $ must_not_be_missing(nums)
	insist $ must_be_collection(nums, invoking_call)

	nums <- as_typed_vector(nums, 'numeric')

	if (length(nums) == 0) {
		integer(0)
	} else {
		as.integer(rank(nums, ties.method = 'first'))
	}
}

#' @rdname xRankOf
#' @export

xRankOf... <- function (...) {
	xRankOf(list(...))
}