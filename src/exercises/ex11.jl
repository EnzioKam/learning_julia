# Exercise 11-1
function histogram(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    d
end

# println(histogram("brontosaurus"))

# Exercise 11-2
function readerset()
    fin = open("words.txt")
    words = Set{String}()
    for line in eachline("words.txt")
        push!(words, line)
    end
    return words
end

# Exercise 11-3
function invertdict(d)
    inverse = Dict{Int64, Array}()
    for key in keys(d)
        val = d[key]
        push!(get!(inverse, val, []), key)
    end
    return inverse
end

# println(invertdict(histogram("parrot")))

# Exercise 11-4
function ack(m, n)
    if m == 0
        return n + 1
    elseif m > 0 && n == 0
        return ack(m - 1, 1)
    else
        return ack(m - 1, ack(m, n - 1))
    end
end

table = Dict{Pair, Int64}()
function ackmemo(m, n)
    if m == 0
        return n + 1
    elseif m > 0 && n == 0
        return ackmemo(m - 1, 1)
    elseif Pair(m, n) in keys(table)
        return table[Pair(m, n)]
    else
        table[Pair(m, n)] = ackmemo(m - 1, ackmemo(m, n - 1))
        return table[Pair(m, n)]
    end
end

# println(ack(3, 4) == ackmemo(3, 4))

function ex11_4(m, n)
    @time begin
        ackmemo(m, n)
    end
    @time begin
        ack(m, n)
    end
end

# ex11_4(3, 4)

# Exercise 11-5
# Same as 10-7, unique uses Set, same idea.
function hasduplicates(t)
    return unique(t) != t
end

# Exercise 11-6
function rotatechar(c, i)
    if i < 0
        i = mod(i, 26)
    end
    if islowercase(c)
        return Char((c - 'a' + i) % 26 + 'a')
    else
        return Char((c - 'A' + i) % 26 + 'A')
    end
end

function rotateword(str, i)
    result = ""
    for char in str
        result *= rotatechar(char, i)
    end
    return result
end

function rotatepairs(word, set)
    pairs = Array{Pair, 1}();
    for i = 1:25
        rot = rotateword(word, i)
        if rot in set
            push!(pairs, Pair(word, rot))
        end
    end
    return pairs
end

function ex11_6()
    set = readerset()
    for word in set
        pairs = rotatepairs(word, set)
        if !isempty(pairs)
            println(pairs)
        end
    end
end

# ex11_6()