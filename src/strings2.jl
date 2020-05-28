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

# Regex
function usesonly(word, available)
    r = Regex("[^$(available)]")
    !occursin(r, word)
end

println(usesonly("banana", "abn"))
println(usesonly("bananas", "abn"))

m1 = match(r"[^abn]", "banana")
m2 = match(r"[^abn]", "bananas")
println(m1)
println(m2)

println(fieldnames(Regex))
println(fieldnames(RegexMatch))
println(m2.match)
println(m2.offset)