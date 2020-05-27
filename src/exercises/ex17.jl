# Exercise 17-1
struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
end

function timetoint(time::MyTime)
    minutes = time.hour * 60 + time.minute
    seconds = minutes * 60 + time.second
end

function inttotime(seconds::Int64)
    (minutes, second) = divrem(seconds, 60)
    hour, minute = divrem(minutes, 60)
    MyTime(hour, minute, second)
end

# Exercise 17-2
mutable struct Point
    x :: Number
    y :: Number
end

Point(a) = Point(a, 0)
Point() = Point(0, 0)

# println(Point())
# println(Point(7.2))
# println(Point(2.5, 3))
# println(Point(2.5, "abc"))

# Exercise 17-3
import Base.+

function +(p1::Point, p2::Point)
    return Point(p1.x + p2.x, p1.y + p2.y)
end

function +(p1::Tuple, p2::Point)
    return Point(p1[1] + p2.x, p1[2] + p2.y)
end

function +(p1::Point, p2::Tuple)
    return Point(p1.x + p2[1], p1.y + p2[2])
end

a = Point(1, 2.0)
b = Point(-1.5, 3.7)
c = (6.5, -4.5)
# println(a + b)
# println(a + c)
# println(c + b)

# Exercise 17-4
using Printf
import Base.+

struct MyTimeMidnight
    seconds :: Int64
end

function Base.show(io::IO, time::MyTimeMidnight)
    (minutes, second) = divrem(time.seconds, 60)
    hour, minute = divrem(minutes, 60)
    @printf(io, "%02d:%02d:%02d", hour, minute, second)
end

function increment(time::MyTimeMidnight, seconds::Int64)
    return MyTimeMidnight(time.seconds + seconds)
    # return inttotime(timetoint(time) + seconds)
end

function +(t1::MyTimeMidnight, t2::MyTimeMidnight)
    return MyTimeMidnight(t1.seconds + t2.seconds)
end

function +(time::MyTimeMidnight, seconds::Int64)
    increment(time, seconds)
end

function +(seconds::Int64, time::MyTimeMidnight)
    time + seconds
end

function ex17_4()
    t1 = MyTimeMidnight(54321)
    t2 = MyTimeMidnight(10000)
    println(t1)
    println(t2)
    println(t1 + t2)
    println(t1 + 1000)
    println(2000 + t1)
end

# ex17_4()

# Exercise 17-5
struct Kangaroo
    pouchcontents :: Array
    function Kangaroo()
        new([])
    end
end

function putinpouch(k::Kangaroo, obj)
    push!(k.pouchcontents, obj)
end

function Base.show(io::IO, k::Kangaroo)
    println(io, "$(k.pouchcontents)")
end

function ex17_5()
    kanga = Kangaroo()
    roo = Kangaroo()
    putinpouch(roo, "abc")
    putinpouch(roo, 123)
    putinpouch(kanga, roo)
    putinpouch(kanga, (1.2, 2.3, "123"))
    println(kanga)
end

# ex17_5()