# Initialisations
d = Dict() # Dict of Any -> Any
dint = Dict{Int64, Int64}() # Dict of Int64 -> Int64
dstr = Dict("one" => "uno", "two" => "dos", "three" => "tres")
eg1 = Dict([('a', 1), ('c', 3), ('b', 2)])
eg2 = Dict(zip("def", 4:6))
println("eg1: $eg1")
println("eg2: $eg2")

d["abcdef"] = 3
println(d)
dint[7] = 1
println(dint)
# These are not valid:
# dint["abc"] = 3
# dint[11] = "def"

testdel = Dict([(1, 2), (3, 5), (11, 4), (0, 6)])
delete!(testdel, 3)
println("testdel: $(testdel)")
delete!(testdel, 3) # Still valid even if it does not exist
println("testdel: $(testdel)")

println("dstr[\"one\"]: $(dstr["one"])")
println("dint[7]: $(dint[7])")

println("length(dstr): $(length(dstr))")

println("\"one\" ∈ keys(dstr): $("one" ∈ keys(dstr))") # Checks existence of key
println("haskey(dstr, \"one\"): $(haskey(dstr, "one"))") # Also checks existence of key
println("\"dos\" ∈ values(dstr): $("dos" ∈ values(dstr))") # Checks existence of value
println("Pair(\"one\", \"uno\") ∈ dstr: $(Pair("one", "uno") in dstr)") # Checks existence of pair

function printdict(h)
    for c in keys(h)
        println(c, " -> ", h[c])
    end
end

# printdict(dstr)

# Alternatively:
function keyvaluepairs(h)
    for (k, v) in h
        println("$k -> $v")
    end
end

keyvaluepairs(dstr)

function printdictsorted(h)
    for c in sort(collect(keys(h)))
        println(c, " -> ", h[c])
    end
end

# printdictsorted(dstr)

# Reverse lookup
println(findall(isequal("uno"), dstr))