a = 1, 2, 3, 4, 5
b = (6, 7, 8, 9, 10)
println(typeof(a))
println(typeof(backtrace))

c = ("abcdef",) # This is a Tuple
d = ('a') # This is not a tuple
e = tuple() # An empty tuple
f = tuple(1, 'a', "def")
println(typeof(f))

println("b[3]: $(b[3])")
println("c[1]: $(c[1])")
println("a[3:5]: $(a[3:5])")
# Tuples are immutable. This is not valid:
# a[3] = 2

println("(0, 1, 2) < (0, 3, 4): $((0, 1, 2) < (0, 3, 4))") # Similar to Strings

# Tuple arguments
function printall(args...)
    println(args)
end

printall(2,3,4,5)

t = (11, 4)
println(divrem(t...))

g = "12345"
h = [1, 2, 3, 4, 5]
z = zip(g, h) # An iterator
println(z)
for p in z
    print(p, "\t")
end
println()
println("collect(z): $(collect(z))")
println("collect(zip(\"123\", h)): $(collect(zip("123", h)))")

# Tuple looping
t = [('a', 1), ('b', 2), ('c', 3)]
for (l, n) in t
    println("$l : $n")
end

for (i, ele) in enumerate(b)
    println("$i : $ele")
end

# Tuples as dictionary keys
d = Dict(("one", "two") => "three", ("one", "three") => "four")
println("d[\"one\", \"two\"]: $(d["one", "two"])")
for ((t1, t2), t3) in d
    println("$t1, $t2, $t3")
end