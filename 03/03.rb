# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23  24  25
#
# Perfect square is an element of algebraic structure which is equal to the square of another element.

# Calculate the nearest odd perfect square n2 from your input and you have a number that is n-1 Manhattan distance away from the center (the bottom right corner). Then count the distance from your input.

p manhattan(1) == 0
p manhattan(12) == 3
p manhattan(23) == 2
p manhattan(1024) == 31
