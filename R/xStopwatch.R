
#' xStopwatch
#'
#' Create a function that returns true for a preset time after creation.
#'
#' @section Type Signature:
#'    |number| -> (-> &lt;logical>)
#'
#' @param
#'    num a positive number. The number of seconds
#'    the function should return true for.
#'
#' @return
#'    A variadic function that ignores its arguments.
#'
#' @family time_functions
#'
#' @family inpure_functions
#'
#' @example
#'    inst/examples/example-xStopwatch.R
#'
#' @rdname xStopwatch
#' @export

xStopwatch <- MakeFun(function (num) {

	MACRO( Must $ Not_Be_Missing(num) )
	MACRO( Must $ Be_Collection(num) )

	num <- unit_to_value(as_atom(num, 'numeric'))

	MACRO( Must $ Be_Between(num, 0, Inf))

	genesis <- Sys.time()

	function (...) {
		"a function returned by xStopwatch."
		""
		isTRUE(difftime(Sys.time(), genesis, units = 'secs') < num)
	}
})
