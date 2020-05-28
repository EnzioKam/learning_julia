prog = "1 + 2"
ex = Meta.parse(prog)
println(typeof(ex))
dump(ex)

a = :(3 + 4)
println(typeof(a))
b = quote
    5 + 6
end
println(typeof(b))
println(eval(a))
println(eval(b))

macro containervariable(container, element)
    return esc(:($(Symbol(container,element)) = $container[$element]))
end

println(@containervariable "abcdef" 3)
println(@macroexpand @containervariable "abcdef" 3)

# Generated functions
# The input is a type, and the return value is a expression to be evaluated.
@generated function square(x)
    println(x)
    :(x * x)
end

x = square(2);
println(x)
y = square("spam");
println(y)
