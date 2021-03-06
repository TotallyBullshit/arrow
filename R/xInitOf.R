
#' xInitOf
#'
#' Remove the last element of a collection.
#'
#' @section Type Signature:
#'     |any| -> [any]
#'
#' @param
#'    coll a collection. A collection to return
#'    all but the last element of.
#'
#' @param
#'    ... see above.
#'
#' @return
#'    A list.
#'
#' @section Corner Cases:
#'    Returns the empty list if \bold{coll} is length-zero.
#'
#' @family selection_functions
#'
#' @template
#'    Variadic
#'
#' @example
#'    inst/examples/example-xInitOf.R
#'
#' @rdname xInitOf
#' @export

xInitOf <- MakeFun(function (coll) {

	MACRO( Must $ Not_Be_Missing(coll) )
	MACRO( Must $ Be_Collection(coll) )

	if (length(coll) == 0 || length(coll) == 1) {
		list()
	} else {
		coll <- as.list(coll)
		coll[-length(coll)]
	}
})

#' @rdname xInitOf
#' @export

xInitOf_ <- MakeVariadic(xInitOf, 'coll')
