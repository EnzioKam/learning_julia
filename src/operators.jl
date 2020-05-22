using Printf

println("Add, subtract, multiply, divide")
@printf("1 + 2 = %d\n", 1 + 2)

@printf("1 - 2 = %d\n", 1 - 2)
@printf("3 * 4 = %d\n", 3 * 4)
@printf("10 / 3 = %.3f\n", 10 / 3)

println("Other operators")
@printf("6^3 = %d\n", 6^3)
@printf("2^0.5 = %f\n", 2^0.5)
@printf("div(11, 4) = %d\n", div(11, 4))
@printf("rem(11, 4) = %d\n", rem(11, 4))
println("divrem(11, 4) = ", divrem(11, 4))

println("Types and rational numbers")
@printf("typeof(5): %s\n", typeof(5))
@printf("typeof(1.23): %s\n", typeof(1.23))
a = rationalize(5.6)
println("a = ", a)
@printf("typeof(a): %s\n", typeof(a))
println(rationalize(BigInt, 10.3))
println("2 // 3 + 4 // 5 = ", 2//3 + 4//5)
@printf("numerator(a) = %d\n", numerator(a))
@printf("denominator(a) = %d\n", denominator(a))

println("Equality testing")
println(1 == 2)
println(1 + 1 == 2)
println(1 != 2)

println("Inequality testing")
println(1 < 2)
println(1 > 2)
println(1 <= 2)
println(1 <= 1)
println(1 > 2)
println(2 >= 2)

println("Identity testing")
println(1 === 2)
println(1 + 1 === 2)
println(1 !== 2)

println("Type testing")
println(isa(1, Int))
println(isa(1, Float64))
println(isa(1, Char))
println(isa(1, Matrix))

println("Some extra stuff")
println(1_000_000) # An integer
println((1, 000, 000)) # Tuple of integers
println(Inf, "\n", -Inf)
println(Inf + -Inf)
println(Inf * -Inf)
println(Inf + Inf)
println(pi)
println(round(1234, sigdigits=2))
println(round(123.456, digits=2))