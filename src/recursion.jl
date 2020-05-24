function printinrange(a, b)
    println(a)
    if a == b
        return
    else
        return printinrange(a + 1, b)
    end
end

# printinrange(2, 10)

function fibonacci(n)
    if n == 0
        return 0
    elseif n == 1
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end

# println(fibonacci(3))

const table = Dict(0=>0, 1=>1)
function fibmemo(n)
    if n in keys(table)
        return table[n]
    else
        res = table[n] = fibmemo(n - 1) + fibmemo(n - 2)
        return res
    end
end

# println(fibmemo(1000))