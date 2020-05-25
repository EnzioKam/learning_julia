# Exercise 12-1
function sumall(args...)
    return sum(args)
end

# println(sumall(1,2,3,4,5))

# Exercise 12-2
function histogram(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    d
end

function keyvaluepairs(h)
    lst = Array{Tuple, 1}()
    for (k, v) in h
        push!(lst, (k, v))
    end
    return lst
end

function mostfrequent(str)
    lst = keyvaluepairs(histogram(str))
    sort!(lst, by = x -> x[2])
    return lst
end

# println(mostfrequent("brontosaurus"))

# Exercise 12-3
# Hashing by FTOA.

# Exercise 12-4
function readerhist()
    fin = open("words.txt")
    words = Dict{String, Dict}()
    for line in eachline("words.txt")
        words[line] = histogram(line)
    end
    return words
end

function invertdict(d)
    inverse = Dict()
    for key in keys(d)
        val = d[key]
        push!(get!(inverse, val, []), key)
    end
    return inverse
end

function metathesis(words)
    chartowords = invertdict(words)
    for (word, hist) in words
        if !haskey(chartowords, hist)
            continue
        end
        candidate = chartowords[hist]
        if length(candidate) > 1
            println(candidate)
            delete!(chartowords, hist)
        end
    end
end

# metathesis(readerhist())

# Exercise 12-5
# Finding longest path in DAG, toposort then DP.