# Some built-in functions
println("println is a function")
println("parse(Int64, \"123\"): $(parse(Int64, "123"))")
println("parse(Float64, \"123.456\"): $(parse(Float64, "123.456"))")
println("trunc(Int64, 3.67123): $(trunc(Int64, 3.67123))")
println("trunc(Int64, -3.67123): $(trunc(Int64, -3.67123))")
println("Other examples: ", float(32), "\t", string(32), "\t", string(123.456))
println("Natural log and base, log(exp(1)): $(log(exp(1)))")
println("Other log bases, log2(10), log10(10): $(log2(10)), $(log10(10))")
println("Trigonometry, sin(pi), cos(pi), tan(pi): $(sin(pi)), $(cos(pi)), $(tan(pi))")
println("sqrt(2) = $(sqrt(2))")

# Defning functions
function printlines()
    println("This is the first line.")
    println("This is the second line.")
end

# printlines()

function printmorelines()
    printlines()
    printlines()
end

# printmorelines()

function printargument(arg)
    println(arg)
end

printargument(123)
printargument("123456")
printargument(cos(pi/2))

# Locality of variables and parameters
function sumthree(a, b, c)
    a = a + b
    total = a
    total += c
    return total
end
d, e, f = 1, 2, 3
println("sumthree(d, e, f): $(sumthree(d, e, f))")
println("d, e, f: $d, $e, $f")
# These lines will cause an error:
# println(a, b, c)
# println(total)

# Example of void function that returns nothing:
println(printlines())

# Example of a docstring
"""
polyline(t, n, len, angle)

Draws n line segments with the given length and
angle (in degrees) between them.  t is a turtle.
"""
function polyline(t, n, len, angle)
end

# Example of including errors
function fact(n)
    if !(n isa Int64)
        error("Factorial is only defined for integers.")
    elseif n < 0
        error("Factorial is not defined for negative integers.")
    elseif n == 0
        return 1
    else
        return n * fact(n-1)
    end
end

# println(fact(1.5))
# println(fact(-1))

# Shorthand notation for function definition
function func_ex(a=1, b=2)
    return a + 2b
end

# The above function definition is equivalent to the following:
func(a, b) = a + 2b
func(a) = func(a, 2)
func() = func(1, 2)
println("func(7, 5): $(func(7, 5))")
println("func(2): $(func(2))")
println("func(): $(func())")