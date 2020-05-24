arr = [1, 2, 23, 24, 6]
push!(arr, 7)
println(arr)

arr2 = [11, 12, 13]
append!(arr, arr2)
println(arr, ", ", arr2)

sort(arr) # Returns copy
println(arr)
sort!(arr) # Mutates array
println(arr)

println("sum(arr): $(sum(arr))")

function addone(x)
    return x + 1
end

a = map(addone, arr)
println(a)
b = zeros(3)
map!(addone, b, arr)
println(b)

c = [1, 2, 3, 4, 5]
filter(iseven, c)
println(c)
d = [1, 2, 3]
filter!(iseven, d)
println(d)

println(reduce(+, c))

println("c = $(c)")
println("c .+ 5 = $(c .+ 5)")
strings = ["this", "is", "an", "array"]
println("strings = $(strings)")
println("uppercase.(strings) = $(uppercase.(strings))")

println("splice!(strings, 3): $(splice!(strings, 3)),\tstrings: $strings")
println("pop!(strings): $(pop!(strings)),\tstrings: $strings")
println("arr: $(arr)")
println("popfirst!(arr): $(popfirst!(arr)),\tstrings: $arr")
println("pushfirst!(arr, 100, 101): $(pushfirst!(arr, 100, 101))")
println("deleteat!(arr, 3): $(deleteat!(arr, 3))")
println("insert!(arr, 5, 33): $(insert!(arr, 5, 33))")

println(collect(1:2:13))
println(collect("a b c d e f g"))
println(split("a b c d e f g"))
println(split("a_b_c_d_e_f_g", '_'))
t = ["I", "am", "groot"]
println(join(t, ' '))
println(join(t, '-'))

e = [1, 2, 3]
f = [4, 5, 6]
g = vcat(e, f)
println("e: $e,\tf: $f,\tg: $g")