
#' xLift
#'
#' Compose a binary function with two other functions.
#'
#' @param fn a binary function.
#' @param fns a list of binary functions.
#'
#'
#' @return returns a unary function of x.
#'
#' @example inst/examples/blank.R
#' @export

#' @export

xLift <- function (fn, fns) {
	# the phoenix or Phi combinator

	parent_call <- sys.call()
	parent_frame <- parent.frame()

	assert(
		!missing(fn), parent_call,
		exclaim$parameter_missing(fn))

	assert(
		!missing(fns), parent_call,
		exclaim$parameter_missing(fns))

	fn <- dearrowise(fn)
	fns <- dearrowise(fns)

	assert(
		is_fn_matchable(fn), parent_call,
		exclaim$must_be_matchable(fn))

	assert(
		all(sapply(fns, is_fn_matchable)), parent_call,
		exclaim$must_be_recursive_of_matchable("fns"))

	fn <- match.fun(fn)
	fns <- lapply(fns, match.fun)

	function (...) {
		do.call(fn,
			lapply(fns, function (lifted) lifted(...)) )
	}
}

#' @export

xLift... <- function (fn, ...) {
	do.call( xLift, list(fn, list(...)) )
}

#' @export

xPhoenix <- xLift

#' @export

xS. <- xPhoenix