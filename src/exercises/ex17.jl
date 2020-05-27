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