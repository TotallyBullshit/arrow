
forall <- arrow:::forall
test_cases <- arrow:::test_cases

require(arrow)

message("xTabulate")

	forall(
		"tabulation of the empty coll is the empty list",
		test_cases$collection_zero,
		xTabulate(coll) %equals% list()
	)

	forall(
		"tabulates a num repeat num times is [num, num]",
		test_cases$num_positive_integer,
		xTabulate(rep(num, num)) %equals% list(list(num, num))
	)

	forall(
		"tabulates a num repeat num times is [num, num]",
		test_cases$num_positive_integer,
		xTabulate( c(rep(num, num), rep(num+1, num+1)) ) %equals%
		list(
			list(num, num),
			list(num+1, num+1))
	)
