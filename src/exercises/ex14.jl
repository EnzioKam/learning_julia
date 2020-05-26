# Exercise 14-1
include("./wc.jl")
using .LineCount
a = linecount("./src/exercises/wc.jl")
# println(a)

# If in REPL mode, run the following:
# include("./src/exercises/wc.jl")
# using .LineCount
# linecount("./src/exercises/wc.jl")

# Exercise 14-2
function sed(str, rpl, file1, file2)
    try
        io1 = open(file1, "r")
        io2 = open(file2, "w")
        while !eof(io1)
            line = read(io1, String)
            newline = replace(line, str => rpl)
            write(io2, newline)
        end
        close(io1)
        close(io2)
    catch exc
        println("Oh no! : $exc")
    end
end

file1 = "./src/exercises/str.txt"
file2 = "./src/exercises/rpl.txt"
file3 = "not a file"
# sed("ab", "(new)", file1, file2)
# sed("ab", "(new)", file3, file2)

# Exercise 14-4
function printallfiles(dir, ext)
    n = length(ext)
    for (root, dirs, files) in walkdir(dir)
        #=
        println("Directories in $root")
        for dir in dirs
            println(joinpath(root, dir)) # path to directories
        end
        println("Files in $root")
        =#
        for file in files
            if file[end-n+1:end] == ext
                println(joinpath(root, file)) # path to files
            end
        end
    end
end

# printallfiles(".", ".txt")