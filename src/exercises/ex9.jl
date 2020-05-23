# Download the .txt file using curl as follows
# curl -o words.txt  https://raw.githubusercontent.com/BenLauwens/ThinkJulia.jl/master/data/words.txt

# Exercise 9-1
function ex9_1()
    fin = open("words.txt")
    for line in eachline("words.txt")
        if length(line) > 20
            println(line)
        end
    end
end

# ex9_1()

# Exercise 9-2
function hasno_e(word)
    return 'e' ∉ word
end

# println(hasno_e("abcdef"))
# println(hasno_e("abcdf"))

function ex9_2()
    fin = open("words.txt")
    count = 0
    total = 0
    for line in eachline("words.txt")
        if hasno_e(line)
            println(line)
            count += 1
        end
        total += 1
    end
    return count /  total
end

# println(ex9_2())

# Exercise 9-3
function avoids(word, banned)
    for ch in banned
        if ch in word
            return false
        end
    end
    return true
end

# println(avoids("abcdef", "awxy"))
# println(avoids("abcdef", "zwxy"))

function ex9_3()
    println("Enter forbidden characters:")
    banned = readline()

    fin = open("words.txt")
    count = 0
    for line in eachline("words.txt")
        if avoids(line, banned)
            count += 1
        end
    end
    return count
end

# println(ex9_3())

# Exercise 9-4
function useonly(word, letters)
    for ch in word
        if ch == ' '
            continue
        elseif lowercase(ch) ∉ letters
            return false
        end
    end
    return true
end

# println(useonly("Hoe alfalfa?", "acefhlo?"))
# println(useonly("Hoe galfalfa?", "acefhlo?"))

# Exercise 9-5
function useall(word, letters)
    for ch in letters
        if ch ∉ word
            return false
        end
    end
    return true
end

function useall(word, letters)
    return useonly(letters, word)
end

# println(useall("Hoe alfalfa?", "acefhlo?"))
# println(useall("abcdefabcdef", "abcdef"))

function ex9_5()
    check = "aeiou"
    fin = open("words.txt")
    count1, count2 = 0, 0
    for line in eachline("words.txt")
        if useall(line, check)
            count1 += 1
            if 'y' in line
                count2 += 1
            end
        end
    end
    return count1, count2
end

# println(ex9_5())

# Exercise 9-6
function isabecedarian(word)
    index = firstindex(word)
    len = length(word)
    while index < len && index + 1 < len
        if index == 1
            curr = word[index]
        end
        next = word[index + 1]
        if word[index] == word[index + 1] || word[index] + 1 == word[index + 1]
            index += 1
            continue
        else
            return false
        end
    end
    return true
end

# println(isabecedarian("abcdef"))
# println(isabecedarian("abccdef"))
# println(isabecedarian("zabccdef"))

function ex9_6()
    fin = open("words.txt")
    count = 0
    for line in eachline("words.txt")
        if isabecedarian(line)
            count += 1
        end
    end
    return count
end

# println(ex9_6())

# Exercise 9-7
function checkthree_doubles(word)
    count, index = 0, 1
    while index <= length(word) - 1
        if word[index] == word[index + 1]
            count += 1
            if count == 3
                return true
            end
            index += 2
        else
            index += 1 - 2*count
            count = 0
        end
    end
    return false
end

# println(checkthree_doubles("bookkeeper"))
# println(checkthree_doubles("bookkaeeper"))

function ex9_7()
    fin = open("words.txt")
    for line in eachline("words.txt")
        if checkthree_doubles(line)
            println(line)
        end
    end
end

# ex9_7()

# Exercise 9-8
function ispalindrome(number, l, r)
    word = string(number)
    substr = word[l:r]
    return substr == reverse(substr)
end

# println(ispalindrome("abcba", 1, 5))
# println(ispalindrome("zzzzheyayehzzz", 5, 11))
# println(ispalindrome("zzzzheyayehzzz", 3, 12))

function checknumber(n)
    return (
        ispalindrome(n, 3, 6) 
        && ispalindrome(n + 1, 2, 6) 
        && ispalindrome(n + 2, 2, 5) 
        && ispalindrome(n + 3, 1, 6)
    )
end

function ex9_8()
    for i = 100000 : 999996
        if checknumber(i)
            println(i)
        end
    end
end

# ex9_8()