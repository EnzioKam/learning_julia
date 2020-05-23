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