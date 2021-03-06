
# 1. Subsetting a ocllection
#
# Slice is the replacement for '[[' in Arrow. It behaves similarily.

nums <- 1:10

x_(nums) $ x_Slice(xWhere(nums %% 3 == 0))

# list(3, 6, 9)
#
# which is similar to

# nums[[ nums %% 3 == 0 ]]

# using standard subsetting.
