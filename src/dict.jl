# Initialisations
d = Dict() # Dict of Any -> Any
dint = Dict{Int64, Int64}() # Dict of Int64 -> Int64
dstr = Dict("one" => "uno", "two" => "dos", "three" => "tres")

d["abcdef"] = 3
println(d)
dint[7] = 1
println(dint)
# These are not valid:
# dint["abc"] = 3
# dint[11] = "def"

println("dstr[\"one\"]: $(dstr["one"])")
println("dint[7]: $(dint[7])")

println("length(dstr): $(length(dstr))")

println("\"one\" ∈ keys(dstr): $("one" ∈ keys(dstr))") # Checks existence of key
println("\"dos\" ∈ values(dstr): $("dos" ∈ values(dstr))") # Checks existence of value
println("Pair(\"one\", \"uno\") ∈ dstr: $(Pair("one", "uno") in dstr)") # Checks existence of pair

function printdict(h)
    for c in keys(h)
        println(c, " -> ", h[c])
    end
end

# printdict(dstr)

function printdictsorted(h)
    for c in sort(collect(keys(h)))
        println(c, " -> ", h[c])
    end
end

# printdictsorted(dstr)

# Reverse lookup
println(findall(isequal("uno"), dstr))