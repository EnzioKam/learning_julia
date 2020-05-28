# Multidimensional arrays
z = zeros(Float64, 2, 3)
println(typeof(z))

# Declare array of dimension n x m
n, m = 2, 4
arr = Array{Int}(undef, 2, 4)
println(arr)
println(size(arr))
arr2 = Array{Int}(undef, 3, 2, 2)
println(arr2)
println(size(arr2))

s = ones(String, 1, 3)
println(s)
# Note that s is considered a "row matrix / vector".
# The typical array is considered a "column matrix / vector".
println(s ==  ["", "", ""])

a = [1 2 3; 4 5 6]
println(a) # 2 rows, 3 columns
println(a[1, 2])
a[2, 3] = 10
println(a)

u = a[:,2:end]
println(ℯ.^(im*u))