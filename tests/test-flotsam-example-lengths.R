
require(arrow)

'%+%' <- arrow ::: '%+%'
throw_arrow_warning <- arrow ::: throw_arrow_warning


# -- This unit test checks if the examples are empty.












comment_or_null <-
	xImplode_(
		'|',
		# -- is the line a comment?
		'[ 	]*[#].*$',
		# -- is the line just NULL?
		'^[ 	]*NULL[ 	]*$',
		# -- is the line empty?
		'^$'
	)











message(
	'check that every example ' %+%
	'has non-blank / NULL lines')

# -- this is awful, and should be changed.

example_path      <- system.file(package = 'arrow', 'examples')
inst_example_path <- system.file(package = 'arrow', 'inst/examples')

if (nchar(example_path) > 0 || nchar(inst_example_path) > 0) {

	message("testing for empty examples...")

	dir_path <-
		x_(c(example_path, inst_example_path)) $
		xSelect(path := {
			nchar(path) > 0
		}) $
		x_FirstOf()

	example_lengths <-
		x_(list.files(dir_path, full.names = True)) $
		xMap(path := {

			# -- what is the file name?
			fname <-
				x_(path) $ xExplode('/') $ x_LastOf()

			# -- how many non-empty lines are there?
			len <-
				x_(path)  $ xReadLines() $
				xReject(
					xFix_(xIsMatch, comment_or_null)) $
				x_LenOf()

			list(len, fname)
		})

	empty_examples <- example_lengths $ xSelect(info := {
		xFirstOf(info) == 0
	})

	if (empty_examples $ x_NotEmpty()) {
		message <- xFromChars_(
			'the following ',
			toString(empty_examples $ x_LenOf()),
			' examples were empty;\n',
			empty_examples $ xAtCol(2) $ x_FromLines()
		)

		throw_arrow_warning(message = message)
	}
}
