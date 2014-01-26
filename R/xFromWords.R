
#' xFromWords
#'
#' Concatentate a character vector with spaces as delimiters.
#'
#' @param
#'    strs a collection of length-one character vectors. The
#'    strings to collapse into one string.
#'
#' @param
#'    ... see above.
#'
#' @return
#'    A length-one character vector.
#'
#' @family character_functions
#'
#' @template
#'    Variadic
#'
#'
#' @example
#'    inst/examples/example-xFromWords.R
#'
#' @rdname xFromWords
#' @export

xFromWords <- function (strs) {
	# Collection str -> str
	# collapse the collection strs with a space.

	xImplode(" ", strs)
}

#' @rdname xFromWords
#' @export

xFromWords... <- function (...) {
	xImplode(" ", list(...))
}