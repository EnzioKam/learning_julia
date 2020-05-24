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
function gensample()
    days = Array{Int64, 1}()
    for i = 1:23
        push!(days, rand(1:365))
    end
    return hasduplicates(days)
end

function ex10_8(n)
    count = 0
    for i = 1:n
        if gensample()
            count += 1
        end
    end
    return count / n
end

# println(ex10_8(10000))

# Exercise 10-9
# reader2 takes longer to run due to repeated creation and allocation of new arrays.
function reader1()
    fin = open("words.txt")
    words = Array{String, 1}()
    for line in eachline("words.txt")
        push!(words, line)
    end
    return words
end

function reader2()
    fin = open("words.txt")
    words = Array{String, 1}()
    for line in eachline("words.txt")
        words = [words..., line]
    end
    return words
end

function ex10_9()
    @time begin
        reader1()
    end
    @time begin
        reader2()
    end
end

# ex10_9()

# Exercise 10-10
function inbisect(arr, val)
    lo, hi = firstindex(arr), lastindex(arr)
    while lo <= hi
        mid = lo + (hi - lo) ÷ 2
        if arr[mid] < val
            lo = mid + 1
        elseif arr[mid] > val
            hi = mid - 1
        else
            return mid
        end
    end
    return -1
end

function ex10_10()
    arr = [1, 3, 5, 7, 9, 10, 12, 14, 17, 20]
    println(inbisect(arr, 17))
    println(inbisect(arr, 25))
    println(inbisect(arr, 11))
    println(inbisect(arr, 5))
    println(inbisect(arr, -5))
end

# ex10_10()

# Exercise 10-11
function inbisect(arr, val, lo, hi)
    while lo <= hi
        mid = lo + (hi - lo) ÷ 2
        if arr[mid] < val
            lo = mid + 1
        elseif arr[mid] > val
            hi = mid - 1
        else
            return mid
        end
    end
    return -1
end

function reversepairs()
    words = reader1()
    n = length(words)
    revpairs = Array{Tuple, 1}()
    for i = 1:n
        curr = words[i]
        index = inbisect(words, reverse(curr), i + 1, n)
        if index != -1
            push!(revpairs, (curr, words[index]))
        end
    end
    return revpairs
end

# println(reversepairs())

# Exercise 10-12
function interlock()
    words = reader1()
    n = length(words)
    interlocks = Array{Tuple, 1}()
    for i = 1:n
        curr = words[i]
        odd, even = curr[begin:2:end], curr[begin+1:2:end]
        if inbisect(words, odd) != -1 && inbisect(words, even) != -1
            push!(interlocks, (odd, even))
        end
    end
    return interlocks
end

# println(interlock())

function interlock3()
    words = reader1()
    n = length(words)
    interlocks = Array{Tuple, 1}()
    for i = 1:n
        curr = words[i]
        a, b, c = curr[begin:3:end], curr[begin+1:3:end], curr[begin+2:3:end]
        if inbisect(words, a) != -1 && inbisect(words, b) != -1 && inbisect(words, c) != -1
            push!(interlocks, (a, b, c))
        end
    end
    return interlocks
end

# println(interlock3())