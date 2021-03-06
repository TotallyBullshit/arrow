
#' xExplode
#'
#' Split a string into a character vector using a regular expression.
#'
#' @section Type Signature:
#'     <character> -> &lt;character> -> &lt;character>
#'
#' @param
#'    rexp a regular expression. The pattern at which to
#'    split \bold{str}.
#'
#' @param
#'    str a string. The string to split.
#'
#' @return
#'    A character vector.
#'
#' @section Corner Cases:
#'    Returns the empty string if \bold{str} is length-zero.
#'    If no match is found the original string is returned.
#'    Every element of the returned character vector has one
#'    or more characters - no zero-character elements are ever
#'    generated.
#'
#' @family text_processing_functions
#'
#' @example
#'    inst/examples/example-xExplode.R
#'
#' @rdname xExplode
#' @export

xExplode <- MakeFun(function (rexp, str) {

	MACRO( Must $ Not_Be_Missing(rexp) )
	MACRO( Must $ Not_Be_Missing(str) )

	MACRO( Must $ Be_Collection(rexp) )
	MACRO( Must $ Be_Collection(str) )

	str <- as_atom(str, "character")
	rexp <- unit_to_value(as_atom(rexp, "character"))

	if (length(str) == 0) {
		character(0)
	} else if (nchar(str) == 0) {
		''
	} else {
		exploded <- strsplit(str, rexp)[[1]]
		exploded[nchar(exploded) > 0]
	}
})
