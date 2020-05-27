using Printf

struct MyTimeOld
    hour :: Int64
    minute :: Int64
    second :: Int64
end

# This is a copy constructor, it creates a copy of the original object.
function MyTimeOld(time::MyTimeOld)
    MyTimeOld(time.hour, time.minute, time.second)
end

println(MyTimeOld(1, 2, 3))

# Inner constructors. Note that there will be no default constructor.
struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
    function MyTime(hour::Int64=0, minute::Int64=0, second::Int64=0)
        @assert(0 ≤ minute < 60, "Minute is not between 0 and 60.")
        @assert(0 ≤ second < 60, "Second is not between 0 and 60.")
        new(hour, minute, second)
    end
end

println(MyTime())
println(MyTime(11))
println(MyTime(11, 23))
println(MyTime(11, 23, 45))

mutable struct MMyTime
    hour :: Int
    minute :: Int
    second :: Int
    function MMyTime(hour::Int64=0, minute::Int64=0, second::Int64=0)
        @assert(0 ≤ minute < 60, "Minute is between 0 and 60.")
        @assert(0 ≤ second < 60, "Second is between 0 and 60.")
        time = new()
        time.hour = hour
        time.minute = minute
        time.second = second
        time
    end
end

function Base.show(io::IO, time::MyTime)
    @printf(io, "%02d:%02d:%02d", time.hour, time.minute, time.second)
end

time = MyTime(9, 45)
print(time)

# Overloading
function timetoint(time::MyTime)
    minutes = time.hour * 60 + time.minute
    seconds = minutes * 60 + time.second
end

function inttotime(seconds::Int64)
    (minutes, second) = divrem(seconds, 60)
    hour, minute = divrem(minutes, 60)
    MyTime(hour, minute, second)
end

import Base.+

function +(t1::MyTime, t2::MyTime)
    seconds = timetoint(t1) + timetoint(t2)
    inttotime(seconds)
end

start = MyTime(9, 45)
duration = MyTime(1, 35, 0)
println(start + duration)

function increment(time, seconds)
    return inttotime(timetoint(time) + seconds)
end

function +(time::MyTime, seconds::Int64)
    increment(time, seconds)
end

function +(seconds::Int64, time::MyTime)
    time + seconds
  end

println(start + 5)
println(10 + start)