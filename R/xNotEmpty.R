
#' xNotEmpty
#'
#' Is a collection length-zero?
#'
#' @param
#'    coll a collection.
#'
#' @param
#'    ... see above.
#'
#' @return
#'    A boolean value.
#'
#' @template
#'    Variadic
#'
#' @example
#'    inst/examples/example-xNotEmpty.R
#'
#' @rdname xNotEmpty
#' @export

xNotEmpty <- function (coll) {
	# Collection -> boolean
	# is collection length == 0?

	invoking_call <- sys.call()

	assert(
		!missing(coll), invoking_call,
		exclaim$parametre_missing(coll))

	insist$must_be_collection(coll, invoking_call)

	length(coll) != 0
}

#' @rdname xNotEmpty
#' @export

xNotEmpty... <- function (...) {
	xNotEmpty(list(...))
}