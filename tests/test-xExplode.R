
forall <- arrow:::forall
test_cases <- arrow:::test_cases

require(arrow)

message('xExplode')

	forall(
		"splitting a character(0) is character(0)",
		test_cases$str_word,
		xExplode(str, character(0)) %equals% character(0)
	)

	forall(
		"splitting an empty string is the empty string",
		test_cases$str_word,
		xExplode(str, '') == ''
	)
