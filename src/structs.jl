struct Point
    x
    y
end

p = Point(1.0, 5.0)
println("$(p.x), $(p.y)")
# Structs are immutable after initialisation. This is invalid:
# p.x = 7.0

mutable struct MPoint
    x
    y
end

mp = MPoint(6, 10.0)
mp.x = 3.0
mp.y = 2.5
println("$(mp.x), $(mp.y)")

struct Rectangle
    width::Number
    height::Number
    corner
end

r = Rectangle(3, 7.1, MPoint(0.0, 0.0))
# Constructor must adhere to type requirements. This is invalid:
# r_invalid = Rectangle(3, "abc", Point(0.0, 0.0))
println(r.corner.x)

function movepoint!(p, dx, dy)
    p.x += dx
    p.y += dy
    nothing
end

movepoint!(mp, 1.0, 2.0)
println("$(mp.x), $(mp.y)")
# This is invalid since a Point is not mutable:
# movepoint!(p, 1.0, 2.0)

function moverectangle!(rect, dx, dy)
    movepoint!(rect.corner, dx, dy)
end

# The following is valid, because the corner attribute of Rectangle is mutable.
moverectangle!(r, 1.0, 2.0)
println(r)
# Reassignment will still not work since that is mutating the Rectangle object.
# r.corner = MPoint(10.1, 3.2)

mpcopy = deepcopy(mp)
println("mp == mpcopy: $(mp == mpcopy)") # Default behavior follows ===
println("mp === mpcopy: $(mp === mpcopy)")

println("typeof(p): $(typeof(p))")
println("p isa Point: $(p isa Point)")
println("fieldnames(Point): $(fieldnames(Point))")
println("fieldnames(Dict): $(fieldnames(Dict))")
println("isdefined(p, :x): $(isdefined(p, :x))")
println("isdefined(p, :z): $(isdefined(p, :z))")

function isposeven(val::Int64)
    return val > 0 && val % 2 == 0
end

function addposeven(a::Int64, b::Int64)
    if !isposeven(a) || !isposeven(b)
        error("Invalid values used for addposeven.")
    end
    return a + b
end

function addposeven_assert(a::Int64, b::Int64)
    @assert(isposeven(a) && isposeven(b), "Invalid values used for addposeven.")
    return a + b
end

# println(addposeven(2, 3))
# println(addposeven_assert(2, 3))