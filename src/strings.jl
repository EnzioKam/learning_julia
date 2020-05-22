str = "Hello!"
char = 'a'
println("This is a string: ", str)
println("This is a character: ", char)

# These variable names are not valid:
# more@, 123name, keywords such as struct, const, if, begin

# String and Char operations
# "2" - "1", "eggs" / "easy", "third" + "a charm" are invalid
println("\'a\' * \'b\' = ", 'a' * 'b') # The result is a String
println("\"abc\" * \"def\" = ", "abc" * "def")
println("\"a\"^3 = ", "a"^3)
println("\"abc\"^3 = ", "abc"^3)

# Conversions
println(Int('x'))
println(Char(60))
println(isvalid(Char, 0x110000))
# U+0000 through U+D7FF and U+E000 through U+10FFFF are valid

# Access and indexing
# These return characters
println(str[begin]) # Equivalent to print(str[1])
println(str[3])
println(str[end])
# Strings are immutable, str[2] = 'j' is invalid

# These return new strings
println(str[3:3])
println(str[begin:end-1]) # Inclusve start:end
println(str[1:3])

# This returns a SubString, i.e. a view into a String
substr = SubString(str, 1, 4)
println(substr)
println(typeof(substr))

# String lengths
println(length(str))
println(length(substr))
println(length(char))

# Interpolation
a, b = 2, 5
println("a + b = $(a + b)")
println("$str, $char.")

println("""

This
is
a test

""")
# In the repl, you will get "\nThis\nis\na test\n\n"

# String comparison
println("abracadabra" < "xylophone")
println( "abracadabra" == "xylophone")
println( "Hello, world." != "Goodbye, world.")

# Searching
println(findfirst('o', "xylophone"))
println(findlast('o', "xylophone"))
println(findfirst('z', "xylophone")) # Note: typeof(nothing) is nothing
println(findnext('o', "xylophone", 1))
println(findnext('o', "xylophone", 5))
println(occursin("world", "Hello, world."))
println(occursin("o", "Xylophon"))
println(occursin('o', "Xylophon"))