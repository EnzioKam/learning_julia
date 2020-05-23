# Exercise 7-1
function printn(s, n)
    while n > 0
        println(s)
        n -= 1
    end
end

# printn("Repeat", 5)

# Exercise 7-2
const eps = 1e-5

function mysqrt(a)
    x = a / 2
    while true
        y = (x + a/x) / 2
        if abs(y - x) < eps
            break
        end
        x = y
    end
    return x
end

function testsquareroot()
    println("a\tmysqrt\tsqrt\tdiff")
    println("-\t------\t----\t----")
    for i = 1:10
        myval, jval = mysqrt(i), sqrt(i)
        println("$i,\t$myval,\t$jval,\t$(myval - jval)")
    end
end

# testsquareroot()

# Exercise 7-3
function evalloop()
    println("Enter the next expression:")
    result = nothing
    while true
        str = readline()
        if str == "done"
            return result
        end
        result = eval(Meta.parse(str))
        println(result)
    end
    return result
end

# println(evalloop())

# Exercise 7-4

function estimatepi()
    coeff = 2*sqrt(2)/9801
    
    function term(k)
        return factorial(4*k) * (1103 + 26390*k) / factorial(k)^4 / 396^(4*k)
    end

    sum = curr = term(0)
    k = 1
    while coeff*curr < 1e-15
        curr = term(k)
        sum += curr
        k += 1
    end
    return 1 / (coeff*sum)
end

println(estimatepi())