# Exercise 2-1
# 5
# x = 5
# x + 1
# The output is empty when running in script. 
# With println, the output is 5 followed by error from trying to print x = 5.

# Exercise 2-2
# 1. 42 is not a valid variable name
# 2. Multiple assignment x = y = 1 is valid.
# 3. In the REPL, ; suppresses output
# 4. For integers, it converts it to a float. Used for calling vectorised functions.
# 5. x y is invalid. 5x is valid.

# Exercise 2-3
println("Volume of sphere with radius 5 = $(4/3 * pi * 5^3)")
println("Total cost of 60 books = \$$(round(0.6*24.95 * 60 + 3 + 59 * 0.75, digits=2))")
t1 = 8*60 + 15
t2 = 7*60 + 12
total = (2*t1 + 3*t2) / 60
start = 6*60 + 52
hrs, mins = divrem(start + total, 60)
println("Time to reach home = $(floor(Int, hrs)):$(floor(Int, mins)) am")