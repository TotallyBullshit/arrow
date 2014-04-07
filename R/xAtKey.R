
#' xAtKey
#'
#' Select a particular key from a selection
#'
#' @param
#'     str a string. The key to select.
#'
#' @param
#'     coll a collection.
#'
#' @param
#'    ... see above
#'
#' @return
#'    an arbitrary value.
#'
#' @template
#'    Variadic
#'
#' @example
#'    inst/examples/example-xAtKey.R
#'
#' @family selection_functions
#'
#' @rdname xAtKey
#' @export

xAtKey <- MakeFun(function (str, coll) {
	# number -> Collection any -> any

	invoking_call <- sys.call()

	MACRO( Must $ Not_Be_Missing(str) )
	MACRO( Must $ Not_Be_Missing(coll) )

	MACRO( Must $ Be_Collection(str) )
	MACRO( Must $ Be_Collection(coll) )

	MACRO( Must $ Be_Named(coll) )

	str <- unit_to_value(as_atom(str, 'character'))

	coll[[str]]
})

#' @rdname xAtKey
#' @export

xAtKey... <- function (str, ...) {
	xAtKey(str, list(...))
}