# Exercise 8-1
function backward(str)
    index = lastindex(str)
    while index >= firstindex(str)
        letter = str[index]
        println(letter)
        index = prevind(str, index)
    end
end

# backward("abcdef")
# Alternatively loop on reverse(str)

# Exercise 8-2
prefixes = "JKLMNOPQ"
suffix = "ack"

for letter in prefixes
    if letter == 'O' || letter == 'Q'
        letter *= 'u'
    end
    println(letter * suffix)
end

# Exercise 8-3
# str[:] creates a copy of the original string str.

# Exercise 8-4
function find(word, letter, start)
    index = start
    while index <= sizeof(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end
    return -1
end

# println(find("abcdefabc", 'b', 4))
# println(find("abcdefabc", 'd', 5))

# Exercise 8-5
function count(word, l)
    counter = 0
    for letter in word
        if letter == l
            counter = counter + 1
        end
    end
    println(counter)
end

function count(word, l)
    index = find(word, l, 1)
    count = 0
    while index != -1
        count += 1
        index = find(word, l, index + 1)
        println
    end
    println(count)
end

# count("abbccccdef", 'c')
# count("abbccccdef", 'b')

# Exercise 8-6
function isreverse(word1, word2)
    if length(word1) != length(word2)
        return false
    end
    i = firstindex(word1)
    j = lastindex(word2)
    while j >= 0 && i <= lastindex(word1)
        # @show i j
        if word1[i] != word2[j]
            return false
        end
        i = nextind(word1, i)
        j = prevind(word2, j)
    end
    true
end

println(isreverse("pots", "stop"))

# Exercise 8-7
println(strip("    a b c    "))
println(strip("{3, 5}\n", ['{', '}', '\n']))

println(replace("There is a large tree in this forest of trees.", "tree" => "monkey"))
println(replace("The fast human is a fast runner.", "fast " => ""))
println(replace("The fast human is a fast runner.", "fast " => "", count=1))

# Exercise 8-8
println(count(i -> i == 'a', "banana"))

# Exercise 8-9
function ispalindrome(word)
    reversed = word[end:-1:begin]
    return word == reversed
end

println(ispalindrome("abccba"))
println(ispalindrome("abcdef"))

# Exercise 8-10
# This checks if the first character is lowercase.
function anylowercase1(s)
    for c in s
        if islowercase(c)
            return true
        else
            return false
        end
    end
end

# This checks if the character 'c' is lowercase, and will always return the string "true".
function anylowercase2(s)
    for c in s
        if islowercase('c')
            return "true"
        else
            return "false"
        end
    end
end

# This checks if the last character is lowercase.
function anylowercase3(s)
    for c in s
        flag = islowercase(c)
    end
    flag
end

# This correctly checks if any character contains a lowercase.
function anylowercase4(s)
    flag = false
    for c in s
        flag = flag || islowercase(c)
    end
    flag
end

# This returns false the moment it finds the first lower case.
function anylowercase5(s)
    for c in s
        if !islowercase(c)
            return false
        end
    end
    true
end

# Exercise 8-11
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

# println(rotatechar('a', 1))
# println(rotatechar('Z', 5))

function rotateword(str, i)
    result = ""
    for char in str
        result *= rotatechar(char, i)
    end
    return result
end

println(rotateword("cheer", 7))
println(rotateword("melon", -10))
println(rotateword("IBM", -1))