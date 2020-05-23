strings = ["this", "is", "an", "array"]
ints = [1, 2, 3, 4]
floats = [1, 2, 3.0, 4]
empty = []
println(length(strings))
println(length(empty))

# Arrays can contain mixed elements
mixed = ["string", 1, 3.0]
println(typeof(mixed)) # Array containing elements of Any type

# Nested Arrays
nest = [[1,2], [3,4,5], [6]]
nest2 = [[1,2], "string", [6]]
nest3 = [[1, [3,4]], "string", [6]]
println(typeof(nest), '\t', length(nest))
println(typeof(nest2), '\t', length(nest2))
println(typeof(nest3), '\t', length(nest3))

# Access and assignment
println("ints[3]: $(ints[3])")
println("nest3[1]: $(nest3[1])")
println("nest3[1][2]: $(nest3[1][2])")
ints[3] = 7
println("ints[3]: $(ints[3])")
println("ints: $(ints)")

println("3 ∈ ints : $(3 ∈ ints)")
println("\"an\" ∈ strings : $("an" ∈ strings)")

# Looping
for num in ints
    print(num, '\t')
end
println()

for i in eachindex(strings)
    strings[i] *= 'z'
end
println(strings)