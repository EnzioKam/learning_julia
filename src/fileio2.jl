# Exceptions
function exception1()
    try
        fin = open("this_file_does_not_exist.txt")
    catch exc
        println("Oh no! : $exc")
    end
end

function exception2()
    f = open("output.txt")
    try
        line = readline(f)
        println(line)
    finally
        close(f)
    end
end

# exception1()
# exception2()

# Serialization
using Serialization

io = IOBuffer()
a = [1, 2, 3, 4, 5]
serialize(io, a) # Translate object to byte array
s = take!(io)
println(s)
b = deserialize(IOBuffer(s));
println(b)
close(io)
# Note that they are no longer the same object:
println("a === b: $(a === b)")

# Command objects
cmd = `cmd /c echo hello` # In Windows
# cmd = `echo hello` in Unix
# Alternatively: cm = @cmd " echo 1 "
run(cmd)
a = read(cmd, String)
print(a)

filename = ".gitignore"
md5 = `powershell /c Get-FileHash $filename -algorithm md5`
# run(md5)

# Importing Julia files / modules
# include("wc.jl")

s = "1 2\t 3\n 4";
repr(s) # Produces: "\"1 2\\t 3\\n 4\""
dump(s) # Produces: String "1 2\t 3\n 4"