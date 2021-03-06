
# Package Internals
#
# Documentation for the internals of Arrow.
# Every sufficiently large utility library will contain its own utility library.
# These functions are required to reduce repetition of code when implementing arrow
# functions.
#
# @keywords internal
# @rdname pkg-internal

# --------------------- shorthand logical functions --------------------- #
# these are exported by arrow seperately.

Truth <- function (...) {
	True
}
Falsity <- function (...) {
	False
}
Moot <- function (...) {
	Na
}

# --------------------- safe replacements


# Sample is insane in R.
# sample(10, size = 1) ~ 10, which makes it awful for
# shuffling random integer vectors.

rsample <- function (coll, ...) {
	if (is.numeric(coll) && length(coll) == 1) {
		coll
	} else {
		sample(coll, ...)
	}

}

# is.na fails for Null and other annoying cases.

is_na <- function (coll) {

	vapply(coll, function (elem) {

		isTRUE(
			identical(elem, NA) ||
			identical(elem, NA_integer_) ||
			identical(elem, NA_character_) ||
			identical(elem, NA_real_) ||
			identical(elem, NA_complex_))

	}, logical(1))
}

elem_is_na <- function (coll) {
	if (is.atomic(coll)) {
		is.na(coll)
	} else if (is.list(coll) || identical(coll, NULL)) {
		# -- runs if any list or pairlist.

		vapply(coll, function (elem) {

			isTRUE(
				identical(elem, NA) ||
				identical(elem, NA_integer_) ||
				identical(elem, NA_character_) ||
				identical(elem, NA_real_) ||
				identical(elem, NA_complex_))

		}, logical(1))
	}
}

elem_is_nan <- function (coll) {
	if (is.atomic(coll)) {
		is.nan(coll)
	} else if (is.list(coll) || identical(coll, Null)) {
		# -- runs if any list or pairlist.
		vapply(coll, function (elem) {
			isTRUE(identical(elem, NaN))
		}, logical(1))
	}
}

# -- corrects the null corner case of is.atomic

is_atomic <- function (coll) {
	if (identical(coll, NULL)) {
		False
	} else {
		is.atomic(coll)
	}
}

# -- corrects the null corner case of is.list

is_generic <- function (coll) {
	if (identical(coll, NULL)) {
		True
	} else {
		is.list(coll)
	}
}











# --------------------- misc. tools --------------------- #

# @section one_of:
#
# Return one value from a collection.
#
# @keywords internal
# @rdname pkg-internal

one_of <- function (coll) {
	# coll [any] -> any
	# select a single value from a collection.

	ith <- rsample(seq_along(coll), size = 1)
	coll[[ith]]
}

# @section equals:
#
# R's equal operator doesn't work on lists or strange values.
# equals is a better measure of identity.
#
# @keywords internal
# @rdname pkg-internal

'%equals%' <- function (a, b) {
	# are two values identical?

	identical(a, b)
}

make_formals <- function (params) {
	structure(
		rep(list(quote(expr=)), length(params)),
		names = params)
}

# @section call_with_params:
#
# Construct a call to a function 'fnname' with the parametres of
# a second function. Useful for higher order functions.
#
# @keywords internal
# @rdname pkg-internal

call_with_params <- function (fnname, fn) {
	# string -> function -> call
	# create call for a function with
	# the arguments of another function.

	as.call(
		lapply(
			c(fnname, names(xFormalsOf(fn)) ),
			as.symbol))
}

# @section +:
#
# Concatenate two strings.
#
# @keywords internal
# @rdname pkg-internal

"%+%" <- function (x, y) {
	# javascript-style string concatenation.

	paste0(x, y, sep = "")
}

# @section in:
#
# An infix function to test for the non-membership of an element in a set.
#
# @keywords internal
# @rdname pkg-internal

'%!in%' <- function (x, y) {
	!(x %in% y)
}

# to dedottify my code.
match_fn <- match.fun

# --------------------- environment manipulation --------------------- #

# @section Object:
#
# Construct an empty environment.
#
# @keywords internal
# @rdname pkg-internal

Object <- function () {
	# construct an empty environment.

	new.env(parent = emptyenv())
}

# @section join_env:
#
# Join two environments together into one environment. This
# allows for inheritance of environments without having
# to traverse multiple environments.
#
# @keywords internal
# @rdname pkg-internal

join_env <- function (x, y) {
	# do not use this often; it's a very slow
	# way of joining two environments.

	if (missing(x)) {
		stop("internal error: joining environments failed.")
	}
	if (missing(y)) {
		stop("internal error: joining environments failed.")
	}

	as.environment( c(as.list( x ), as.list( y )) )
}

# --------------------- property tests --------------------- #

# @section is_fn_matchable:
#
# Is a value a function, or possibly the name of a function.
#
# @keywords internal
# @rdname pkg-internal

is_fn_matchable <- function (val) {
	# is a value a function or matchable as a function?

	is.function(val) || is.symbol(val) ||
	(is.character(val) && length(val) == 1)
}

# @section is_collection:
#
# Is a value a generic or atomic vector or a pairlist.
#
# @keywords internal
# @rdname pkg-internal


is_collection <- function (val) {
	# is a value a pairlist, list or typed vector?

	# -- the two bad coner cases of is atomic and is null
	# -- counteract; will be true for any pairlist, list or vector, including NULL.
	is.atomic(val) || is.list(val)
}

is_recursive <- function (val) {
	# -- don't change. is.recursive is ~ !is.atomic.
	# -- is list checks lists, pairlists. Add null check.
	is.list(val) || identical(val, NULL)
}

# --------------------- coercion functions --------------------- #

as_parametres <- function (names) {
	# takes a string of names and converts them to
	# a pairlist of formals with no defaults.

	structure(
		replicate(length(names), quote(expr=)),
		names = names
	)
}

# --------------------- testing & message functions --------------------- #


ddparse <- function (val, collapse = "") {
	# safely deparse a string.

	paste0(deparse(val), collapse = collapse)
}

ddquote <- function (sym) {
	paste0(dQuote(match.call()$sym), collapse = '')
}

wrap <- function (...) {
	# wrap and indent a string,

	paste0(
		strwrap(...),
		collapse = '')
}

ith_suffix <- function (num) {
	# number -> string
	# takes a number i, adds the
	# appropriate suffix (1th, 2nd, 3rd, ...)
	# useful for error messages.

	# -- just in case...
	if (num == Inf) {
		return("infinith")
	} else if (num == -Inf) {
		return("-infinith")
	}

	last <- as.numeric(substr(
		toString(num),
		nchar(toString(num)),
		nchar(toString(num)) ))

	suffix <-
		if (num == 2) {
			"nd"
		} else if (num == 3) {
			"rd"
		} else if (num == 11 || num == 12 || num == 13) {
			"th"
		} else if (last == 1) {
			"st"
		} else if (last == 2) {
			"nd"
		} else if (last == 3) {
			"rd"
		} else {
			"th"
		}

	paste0(num, suffix)
}

# -- load the internal tools needed for testing through assign.

load_test_dependencies <- function (envir) {

	deps <-
		list(
			over =
				arrow ::: over,
			describe =
				arrow ::: describe,
			when =
				arrow ::: when,
			run =
				arrow ::: run,
			failsWhen =
				arrow ::: failsWhen,

			`+.xforall` =
				arrow ::: `+.xforall`
		)

	for (key in names(deps)) {
		assign(key, deps[[key]], envir = envir)
	}
}
