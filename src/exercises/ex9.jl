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