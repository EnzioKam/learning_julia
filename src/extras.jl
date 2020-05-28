# Named Tuples
x = (name="abc", title="def")
println(x.name)
println(x.title)
println("$(x[1]), $(x[2])")

# Functions
f(x, y) = x + y
intro = x -> x * " is my name"
println(f(2, 3))
println(intro("John"))

using Plots
plot(x -> x^2 + 2x - 1, 0, 10, xlabel="x", ylabel="y")

function named_args(x, y; a="john", size=3, height=100)
    println("This function works!")
end

# Closure, i.e. return type is a function
foo(x) = ()->x
bar = foo(1)
println(bar())
println(foo(3)())

# Blocks
a, b, c = 1, 2, 3
let x = a, y = b, z = c
    @show x y z
end
# The following is not valid because there are no global x,y,z variables:
# println(x, y, z)

# Error occurs for the following:
# let a = 1, b
#     @show a b c
# end
# a = 1 is local, b is undefined local, c = 3 is global.

function dotest(seq)
    map(seq) do x
        if x < 0 && iseven(x)
            return 0
        elseif x == 0
            return 1
        else
            return x
        end
    end
end

println(dotest([-3,-2,-1,0,1,2,3]))
println(dotest(1:10))

function dotest2(seq1, seq2)
    map(seq1, seq2) do x, y
        x + y
    end
end

println(dotest2([1, 2], [3, 4]))
println(dotest2(1:10, 11:20))

# Ternary Operator: condition ? iftrue: else
a = 5
println(a < 10 ? println("Is < 10") : println("Is >= 10"))

# Short-Circuit Evaluation
# && and || only evaluate subsequent arguments / statements when it is required
function fact(n::Integer)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 1
    n * fact(n-1)
end

# Tasks / coroutines
function fib(c::Channel)
    a = 0
    b = 1
    put!(c, a)
    while true
        put!(c, b)
        (a, b) = (b, a+b)
    end
end

fib_gen = Channel(fib);
for i in 1:10
    println(take!(fib_gen))
end

for val in Channel(fib)
    print(val, " ")
    val > 20 && break
end

# Object-like Functions
struct Point{T<:Real}
    x::T
    y::T
end

function (p::Point)(x)
    return (p.x + p.y) * x
end

p = Point(1, 2)
println(p(1.5))

arr = [1, missing, 2]
println(sum(arr))
println(typeof(missing))
println(sum(skipmissing(arr)))

function squaresum(a::Float64, b::Float64)
    a^2 + b^2
end

using InteractiveUtils

println(@code_lowered squaresum(3.0, 4.0))
println(@code_typed squaresum(3.0, 4.0))
println(@code_llvm squaresum(3.0, 4.0))
println(@code_native squaresum(3.0, 4.0))

@warn "This is an example of a warning."

# Turn on debugging for target module
# ENV["JULIA_DEBUG"] = "all"
ENV["JULIA_DEBUG"] = Main
@debug "The sum of some values $(sum(rand(100)))"