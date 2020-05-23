fruits = "🍌 🍎 🍐"

index = firstindex(fruits)
while index <= sizeof(fruits)
    letter = fruits[index]
    println(letter)
    global index = nextind(fruits, index)
end

println(uppercase("abcdefg"))
println('a' in "abcdef")

# This is not valid:
# println("a" in "abcdef")

# These are also valid:
println(in('a', "abcdef"))
println(!in('z', "abcdef"))
