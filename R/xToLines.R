
#' xToLines
#'
#' Split a string at every newline character.
#'
#' @section Type Signature:
#'     &lt;character> -> &lt;character>
#'
#' @details
#'    The input string is split at newline characters.
#'    Multiple newlines are treated the same as one newline.
#'
#' @param
#'    str a length-one character vector. The string to split into
#'    lines.
#'
#' @return
#'    A character vector.
#'
#' @family text_processing_functions
#'
#' @example
#'    inst/examples/example-xToLines.R
#'
#' @rdname xToLines
#' @export

xToLines <- MakeFun(function (str) {

	MACRO( Must $ Not_Be_Missing(str) )
	MACRO( Must $ Be_Collection(str) )

	str <- as_typed_vector(str, 'character')

	if (length(str) == 0 || nchar(str) == 0) {
		character(0)
	} else {
		lines <- strsplit(str, split = "\n+")[[1]]
		lines[nchar(lines) > 0]
	}
})
