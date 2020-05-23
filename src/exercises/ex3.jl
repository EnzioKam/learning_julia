# Exercise 3-1
# repeatlyrics()

function repeatlyrics()
    printlyrics()
    printlyrics()
end

function printlyrics()
    println("I'm a lumberjack, and I'm okay.")
    println("I sleep all night and I work all day.")
end

# Function definition needs to be before the call if calling in global scope.
# If calling from within another function, it can be before.

# Exercise 3-2
function rightjustify(s)
    println(" "^(70-length(s)) * s)
end
# rightjustify("monty")

# Exercise 3-3
function printtwice(bruce)
    println(bruce)
    println(bruce)
end

function dotwiceold(f)
    f()
    f()
end

function dotwice(f, val)
    f(val)
    f(val)
end

function printspam()
    println("spam")
end

# println("dotwice(printtwice, \"spam\")")
# dotwice(printtwice, "spam")

function dofour(f, val)
    dotwice(f, val)
    dotwice(f, val)
end

# println("dofour(printtwice, \"spam\")")
# dofour(printtwice, "spam")

# Exercise 3-4
function printmiddlerow()
    println("|", " "^9, "|", " "^9, "|")
end

function printgrid()
    println("+ - - - - + - - - - +")
    dotwiceold(printmiddlerow)
    dotwiceold(printmiddlerow)
    println("+ - - - - + - - - - +")
    dotwiceold(printmiddlerow)
    dotwiceold(printmiddlerow)
    println("+ - - - - + - - - - +")
end

# printgrid()

function printsmallmiddlerow()
    println("|", " "^5, "|")
end

function printsmallgrid()
    println("+ - - +")
    dotwiceold(printsmallmiddlerow)
    println("+ - - +")
end

printsmallgrid()