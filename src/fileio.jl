# Create file and initialises IOStream
fout = open("output.txt", "w")
a = write(fout, "First line of text.\n")
b = write(fout, "Second line of text.\n")
close(fout) # Closes stream, and writes to file.
println("$a, $b") # Write returns the number of characters written.

fout = open("integers.txt", "w")
num = 123
# The following line with not write the integer 123:
# write(fout, num)
# Convert to string before writing:
write(fout, string(num))
# Alternatively:
println(fout, string(456))
close(fout)

#=
Note the different I/O modes:
open(file, mode)
r: read
w: write, create, truncate
a: write, create. append
r+: read, write
w+: read, write, create, truncate
a+: read, write, create, append
=#

fout = open("output.txt", "a")
write(fout, "Third line of text.")
close(fout)

io = open("output.txt", "r")
println(read(io, String))
println(read(io, String))
println(read(io, String))
close(io)

io = IOBuffer();
write(io, "JuliaLang is a GitHub organization.")
truncate(io, 15)
println(String(take!(io)))
close(io)

# Paths and directories
println("homedir(): $(homedir())")
println("pwd(): $(pwd())")
println("readdir(): $(readdir())")
println("abspath(\".gitignore\"): $(abspath(".gitignore"))")
println("isfile(\".gitignore\"): $(isfile(".gitignore"))")
println("isdir(\".gitignore\"): $(isdir(".gitignore"))")
println("isdir(\"src/exercises\"): $(isdir("src/exercises"))")
println("ispath(\".gitignore\"): $(ispath(".gitignore"))")
println("ispath(\"src/exercises\"): $(ispath("src/exercises"))")

# Similar functions to unix utilities such as cd, rm, mkdir and mkpath. See https://docs.julialang.org/en/v1/base/file/#Base.Filesystem.walkdir
println("joinpath(\"/home/myuser\", \"example.jl\"): $(joinpath("/home/myuser", "example.jl"))")

function printallfiles(dir)
    for (root, dirs, files) in walkdir(dir)
        println("Directories in $root")
        for dir in dirs
            println(joinpath(root, dir)) # path to directories
        end
        println("Files in $root")
        for file in files
            println(joinpath(root, file)) # path to files
        end
    end
end

# printallfiles("src")

itr = walkdir("src");
println(first(itr))
println(first(itr))

# Remove files
rm("output.txt")
rm("integers.txt")