
#' xToLines
#'
#' Split a string at every newline character.
#'
#' @param
#'    str a string.
#'
#' @return
#'    a character vector.
#'
#' @family character_functions
#'
#' @rdname xToLines
#' @export

xToLines <- function (str) {
	# str -> Vector str
	# split str at every newline, returning
	# a character vector of equal or greater length.

	invoking_call <- sys.call()

	assert(
		!missing(str), invoking_call,
		exclaim$parametre_missing(str))

	str <- as_typed_vector(str, 'character')

	if (length(str) == 0 || nchar(str) == 0) {
		character(0)
	} else {
		strsplit(str, split = "\n+")[[1]]
	}
}