
forall <- arrow:::forall
test_cases <- arrow:::test_cases

require(arrow)

message("xIsNan")

	forall(
		"istrue of empty collection is False",
		test_cases$collection_zero,
		!xIsNan(coll)
	)

	forall(
		"isnan of nan is true",
		list(),
		xIsNan(NaN)
	)
