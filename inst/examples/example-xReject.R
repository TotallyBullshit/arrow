
# remove NA values from a list

xReject(is.na, c(1, 2, NA, 3))

list(1, 2, 3)

# remove outliers from a data set.

is_outlier <- function (data_set) {
	# returns a function that tests whether an element of the
	# set is an outlier.

	data_quantile <- quantile(data_set)

	range <- list(
		lower = data_quantile[['25%']],
		higher = data_quantile[['75%']] )


	function (member) {
		member < range$lower || member > range$higher
	}
}

data_set <- c(
	1.0, 0.1, 1.1, 1.2,
	0.1, 0.7, 0.8, 1.1)

xReject(
	is_outlier(data_set), data_set)

list(1, 1.1, 0.8, 1.1)