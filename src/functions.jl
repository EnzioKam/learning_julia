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