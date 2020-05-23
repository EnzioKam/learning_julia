# Exercise 6-1
function compare(x, y)
    return x > y ? 1 : x == y ? 0 : -1
end

# println(compare(5, 7))
# println(compare(6, 6))
# println(compare(8, 6))

# Exercise 6-2
function hypotenuse(a, b)
    return sqrt(a^2 + b^2)
end

# println(hypotenuse(5, 8))

# Exercise 6-3
function isbetween(x, y, z)
    return x <= y <= z
end

# println(isbetween(1, 5, 10))
# println(isbetween(1, 12, 10))

# Exercise 6-4
function b(z)
    prod = a(z, z)
    println(z, " ", prod)
    prod
end

function a(x, y)
    x = x + 1
    x * y
end

function c(x, y, z)
    total = x + y + z
    square = b(total)^2
    square
end

x = 1
y = x + 1
# println(c(x, y+3, x+y))

# Exercise 6-5
function ack(m, n)
    if m == 0
        return n + 1
    elseif m > 0 && n == 0
        return ack(m - 1, 1)
    else
        return ack(m - 1, ack(m, n - 1))
    end
end

# println(ack(3, 4))

# Exercise 6-6
function first(word)
    first = firstindex(word)
    word[first]
end

function last(word)
    last = lastindex(word)
    word[last]
end

function middle(word)
    first = firstindex(word)
    last = lastindex(word)
    word[nextind(word, first) : prevind(word, last)]
end

word = "ab"
# println(middle(word))

function palindrome(word)
    if length(word) <= 1
        return true
    elseif word[begin] == word[end]
        return palindrome(middle(word))
    else
        return false
    end
end

# println(palindrome("abcdef"))
# println(palindrome("abcdeffedcba"))

# More efficient
function palindrome(word)
    l = length(word)
    for i = 1:div(l, 2)
        if word[i] != word[l - i + 1]
            return false
        end
    end
    return true
end

# Exercise 6-7
function ispower(a, b)
    if a < b
        return false
    elseif a == b
        return true
    elseif a % b == 0
        return ispower(a/b, b)
    else
        return false
    end
end

# println(ispower(32, 2))
# println(ispower(1, 1))
# println(ispower(4, 5))
# println(ispower(6, 6))
# println(ispower(32, 3))

# Exercise 6-8
function gcd(a, b)
    if b == 0
        return a
    else
        return gcd(b, a % b)
    end
end

println(gcd(5, 10))
println(gcd(5, 7))
println(gcd(12, 16))