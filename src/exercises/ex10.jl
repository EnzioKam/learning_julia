# Exercise 10-1
function nestedsum(t)
   return sum(sum.(t)) 
end

t = [[1, 2], [3], [4, 5, 6]]
# println(nestedsum(t))

# Exercise 10-2
function cumulsum(t)
    res = Array{Int64, 1}()
    for ele in t
        if ele == t[begin]
            push!(res, ele)
        else
            push!(res, ele + res[end])
        end
    end
    return res
end

function cumulsum!(t)
    for i in eachindex(t)
        if i == firstindex(t)
            continue
        else
            t[i] += t[prevind(t, i)]
        end
    end
    return t
end

t = [1, 2, 3, 4, 5, 6]
# println(cumulsum(t))
cumulsum!(t)
# println(t)

# Exercise 10-3
function interior(t)
    return t[begin+1:end-1]
end

t = [1, 2, 3, 4, 5, 6]
# println(interior(t))

# Exercise 10-4
function interior!(t)
    pop!(t)
    popfirst!(t)
end

interior!(t)
# println(t)

# Exercise 10-5
function issort(t)
    for i in eachindex(t)
        if i == firstindex(t)
            continue
        else
            if t[i] < t[prevind(t, i)]
                return false
            end
        end
    end
    return true
end

# println(issort([1, 2, 2, 3, 4, 5, 6]))
# println(issort(["abcdef", "bacdef", "cbadef"]))
# println(issort(["d", "bacdef", "cbadef"]))

# Exercise 10-6
function isanagram(a, b)
    return sort(collect(a)) == sort(collect(b))
end

# println(isanagram("abcdef", "acbdef"))
# println(isanagram("aaaa", "bbbb"))

# Exercise 10-7
function hasduplicates(t)
    return unique(t) != t
end

dup = [3, 4, 5, 1, 2, 3, 4, 5]
unq = [1, 2, 3, 4, 5]
# println(hasduplicates(dup))
# println(hasduplicates(unq))

# Exercise 10-8

# Exercise 10-9

# Exercise 10-10

# Exercise 10-11

# Exercise 10-12