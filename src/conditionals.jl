# logical operators
n = 3
println(n % 2 == 0 || n % 3 == 0)
println(n % 2 == 0 && n % 3 == 0)
println(!(n % 2 == 0) && n % 3 == 0)
println(!true)
println("This is valid: 0 < n < 10 = $(0 < n < 10)")

# Conditional operators
if n > 0
    println("n is greater than 0")
end

a, b = 3, 4
if a % 2 == 0
    println("a is even")
elseif b == 4
    println("b is 4, die!")
elseif a < b
    println("a is smaller than b")
else
    println("a is greater than b")
end

# Nested conditional
if a < 10
    if a % 2 != 0
        println("a is odd and less than 10")
    end
end

if a < 10 && b > 3
    println("a is less than 10 and b is greater than 3")
end
