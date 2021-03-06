
forall <- arrow:::forall
test_cases <- arrow:::test_cases

require(arrow)


message("xExists")

	forall(
		"xExists of truth is true`",
		test_cases$collection,
		xExists(Truth, list(coll, coll)),
		given =
			length(coll) > 0
	)

	forall(
		"xExists of falsity is false",
		test_cases$collection,
		!xExists(Falsity, list(coll, coll)),
		given =
			length(coll) > 0
	)

	forall(
		"xExists of moot is false",
		test_cases$collection,
		!xExists(Moot, list(coll, coll)),
		given =
			length(coll) > 0
	)

	forall(
		"xExists of a function that sometimes yields true is true",
		test_cases$integers,
		xExists(
			function (a, b) {
				a %% 2 == 0 || b %% 2 == 1
			}, list(coll, coll)),
		given =
			length(coll) > 0
	)
