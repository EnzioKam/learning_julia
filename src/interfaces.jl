#= Structure of iteration:
for i in iter
    # body
end

next = iterate(iter)
while next !== nothing
    (i, state) = next
    # body
    next = iterate(iter, state)
end
=#

struct Fibonacci{T<:Real}
end

function Fibonacci(d::DataType)
    if d<:Real
        return Fibonacci{d}()
    else
        error("No Real type!")
    end
end

function Base.iterate(::Fibonacci{T}) where {T<:Real}
    return (zero(T), (one(T), one(T)))
end

function Base.iterate(::Fibonacci{T}, state::Tuple{T, T}) where {T<:Real}
    return (state[1], (state[2], state[1] + state[2]))
end

# Alternatively:
# Fibonacci(d::DataType) = d<:Real ? Fibonacci{d}() : error("No Real type!")
# Base.iterate(::Fibonacci{T}) where {T<:Real} = (zero(T), (one(T), one(T)))
# Base.iterate(::Fibonacci{T}, state::Tuple{T, T}) where {T<:Real} = (state[1], (state[2], state[1] + state[2]))

for e in Fibonacci(Int64)
    e > 100 && break
    print(e, " ")
end