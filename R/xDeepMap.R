
# Map a function into a nested collection, preserving its structure.

#' @param fn a unary function, or a
#'     symbol or name identifying such a function.
#' @param coll a pairlist, list, or vector.
#'

#| function: xDeepMap version: 0.1 finished: false 

xDeepMap <- function (fn, coll) {
	# (any -> any) -> List|Pairlist any -> [any]
	# Map a function into a nested collection, 
	# preserving its structure.	

	pcall <- sys.call()
	require_a("functionable", fn, pcall)
	require_a(c("list", "pairlist"), coll, pcall)

	fn <- match.fun(fn)
	require_a("unary function", fn, pcall)

	recur <- function (xs) {

		if (is.list(xs) || is.pairlist(xs)) {
			lapply(xs, recur)
		} else {
			fn(xs)
		}
	}
	recur(as.list(coll))
}