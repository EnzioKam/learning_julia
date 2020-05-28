# Exercise 20-1
function avoids(word, banned)
    return length(intersect(word, banned)) == 0
end

# println(avoids("abcdefghi", "wxyz"))
# println(avoids("abcdefghi", "d"))