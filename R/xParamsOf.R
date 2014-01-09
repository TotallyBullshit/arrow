
#' xParamsOf
#'
#' Get the parametre names of a function or primitive function.
#'
#' @param fn an arbitrary function or primitive function.
#'
#' @return a character vector/.
#'
#' @section Corner Cases:
#'	 If \code{fn} is a primitive function a heuristic is used to obtain
#'	 its parametre names, which may not work for all functions.
#'
#' @family parametre_functions
#'
#' @rdname xParamsOf
#' @export

xParamsOf <- function (fn) {
	# function -> Vector string
	# get the formals of non-primitive functions, and
	# the arguments of primitive functions.

	invoking_call <- sys.call()

	assert(
		!missing(fn), invoking_call,
		exclaim$parametre_missing(fn))

	assert(
		is_fn_matchable(fn), invoking_call,
		exclaim$must_be_matchable(
			fn,	summate(fn)) )

	fn <- match_fn(fn)

	formals_fn <- if (is.primitive(fn)) {
		as.list( head(as.list(args(fn)), -1) )
	} else {
		as.list( formals(fn) )
	}

	if (length(formals_fn) == 0) {
		character(0)
	} else {
		names(formals_fn)
	}
}