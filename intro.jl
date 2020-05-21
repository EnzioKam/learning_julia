println("Hello, World!")

# This is a comment

# println ("this is not allowed")
println("This is allowed.")
println("This is also allowed.");

println(1 + 2)
1 + 2 # Will not print in script

# Installing, updating and removing packages
using Pkg # Alternatively, enter pkg mode in REPL with ]
Pkg.add("Example")
Pkg.status()
Pkg.update("Example") # Pkg.update() updates all packages
Pkg.rm("Example") # removes from environment, does not delete files

# Environments
# In pkg mode:
# activate tutorial
# st
# add Example
# activate # goes back to default environment
