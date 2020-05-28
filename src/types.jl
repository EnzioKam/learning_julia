#=
Abstract types
abstract type «name» end
abstract type «name» <: «supertype» end

List of some abstract types and their supertypes in Julia
abstract type Number end
abstract type Real     <: Number end
abstract type AbstractFloat <: Real end
abstract type Integer  <: Real end
abstract type Signed   <: Integer end
abstract type Unsigned <: Integer end

Primitive types
primitive type «name» «bits» end
primitive type «name» <: «supertype» «bits» end

List of primitive types and their supertypes in Julia
primitive type Float16 <: AbstractFloat 16 end
primitive type Float32 <: AbstractFloat 32 end
primitive type Float64 <: AbstractFloat 64 end

primitive type Bool <: Integer 8 end
primitive type Char <: AbstractChar 32 end

primitive type Int8    <: Signed   8 end
primitive type UInt8   <: Unsigned 8 end
primitive type Int16   <: Signed   16 end
primitive type UInt16  <: Unsigned 16 end
primitive type Int32   <: Signed   32 end
primitive type UInt32  <: Unsigned 32 end
primitive type Int64   <: Signed   64 end
primitive type UInt64  <: Unsigned 64 end
primitive type Int128  <: Signed   128 end
primitive type UInt128 <: Unsigned 128 end
=#

primitive type Byte 8 end
# The function reinterpret is used to store the bits of an unsigned integer with 8 bits (UInt8) into the byte. 
Byte(val::UInt8) = reinterpret(Byte, val)
b = Byte(0x01)
println(b)

# Parametric typing i.e. Generics
struct Point{T<:Real}
    x::T
    y::T
end

println(Point(0.0, 0.0))
println(Point(1, 3))

struct Pair{T1, T2}
    x::T1
    y::T2
end

println(Pair(3, 1.5))

# Unions
IntOrString = Union{Int64, String}
struct Test
    x::IntOrString
end

println(Test("abc"))
println(Test(123))
# This is invalid:
# println(Test('a'))

a = Vector{T} where T<:Real
# In REPL, type ?a
isintpoint(p::Point{T}) where {T} = (T === Int64)
p = Point(1, 2)
println(isintpoint(p))