# Exercise 13-5
function cumulsum(t)
    res = Array{Float64, 1}()
    for ele in t
        if ele == t[begin]
            push!(res, ele)
        else
            push!(res, ele + res[end])
        end
    end
    return res
end

function histogram(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    d
end

function choosefromhist(hist)
    chars, counts = Array{Char, 1}(), Array{Float64, 1}()
    for (k, v) in hist
        push!(chars, k)
        push!(counts, v)
    end
    prob = cumulsum(counts / sum(counts))
    rv = rand()
    for (i, p) in enumerate(prob)
        if rv < p
            return chars[i]
        end
    end
end

hist = histogram("abbbcccccddddddddeeeeeeeeeeeee")
# println(choosefromhist(hist))

# Exercise 13-9
function ex13_9(hist)
    charfreq = collect(hist)
    sort!(charfreq, by = x -> x.second)
    logf, logr = Array{Float64, 1}(), Array{Float64, 1}()
    for (r, pair) in enumerate(charfreq)
        char, f = pair.first, pair.second
        println("$char with f:$f, log f: $(log(f)), log r: $(log(r))")
        push!(logf, log(f))
        push!(logr, log(r))
    end
    return logf, logr
end

# logf, logr = ex13_9(hist)
# using Plots
# plot(logr, logf)