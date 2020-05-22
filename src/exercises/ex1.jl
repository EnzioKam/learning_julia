# Exercise 1-1
# 1. Leaving out () shows function information. Missing parenthesis will result in incomplete expression or error.
# 2. Similar to 1.
# 3. Putting + before numbers will just print the value of the number. 2 ++ 2 is not valid, but 2 + + 2 is valid.
# 4. Leading zeroes will be removed when printed as numbered values.
# 5. Invalid expression, eg. 2 2 is not valid.

# Exercise 1-2
println("Number of seconds in 42min 42s = ", 42*60 + 42, 's')
println("Number of miles in 10km = ", 10 * 1.41, " miles")
println("For a 10km race in 37min and 48s,")
println("Average pace = ", (37 * 60 + 48) / 10, " s/mile")
println("or ", (37 + 48/60) / 10, " min/mile")
println("Average speed = ", 10 / (37 + 48/60) / 60, " miles/hr")