x = 12
println(typeof(x))
y = convert(UInt8, x)
println(y)
println(typeof(y))

# This will flag an error because Uint8 holds up to 2^8 - 1 = 255
# convert(UInt8, 256)

struct Point{T<:Real}
    x::T
    y::T
end

Base.convert(::Type{Point{T}}, x::Array{T, 1}) where {T<:Real} = Point(x...)
println(convert(Point{Int64}, [1, 2]))

a, b = 1.5, 2
println("$(typeof(a)), $(typeof(b))")
c, d = promote(a, b)
println("$(typeof(c)), $(typeof(d))")
# To add functionality for promote, add definition for promote_rule.
# Eg. promote_rule(::Type{Float64}, ::Type{Int32}) = Float64