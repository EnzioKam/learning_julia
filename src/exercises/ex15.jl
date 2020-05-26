# Exercise 15-1
struct Point
    x
    y
end

mutable struct MPoint
    x
    y
end

function distancebetweenpoints(p1::Point, p2::Point)
    dx = (p1.x - p2.x)^2
    dy = (p1.y - p2.y)^2
    return sqrt(dx + dy)
end

p1 = Point(3.0, 4.5)
p2 = Point(-1, 7.6)
# println(distancebetweenpoints(p1, p2))

# Exercise 15-2
# println(p1 == p2)
# println(p1 === p2)

# Exercise 15-3
struct Circle
    center::Point
    radius::Number
end

struct Rectangle
    width::Number
    height::Number
    corner
end

c = Circle(Point(150.0, 100.0), 75.0)
# println(c)

function pointincircle(c::Circle, p::Point)
    return distancebetweenpoints(c.center, p) <= c.radius
end

# function movepoint!(p, dx, dy)
#     p.x += dx
#     p.y += dy
#     nothing
# end

function rectincircle(c::Circle, r::Rectangle)
    w, h = r.width, r.height
    xchange = [0, 0, w, 0]
    ychange = [0, h, 0 , h]
    px, py = r.corner.x, r.corner.y
    condition = true
    for (i, dx) in enumerate(xchange)
        dy = ychange[i]
        if !pointincircle(c, Point(px + dx, py + dy))
            condition &= false
        end
    end
    return condition
end

r = Rectangle(3, 7.1, MPoint(0.0, 0.0))
c2 = Circle(Point(0.0, 0.0), 10)
# println(rectincircle(c, r))
# println(rectincircle(c2, r))

function rectcircleoverlap(c::Circle, r::Rectangle)
    w, h = r.width, r.height
    xchange = [0, 0, w, 0]
    ychange = [0, h, 0 , h]
    px, py = r.corner.x, r.corner.y
    for (i, dx) in enumerate(xchange)
        dy = ychange[i]
        if pointincircle(c, Point(px + dx, py + dy))
            return true
        end
    end
    return false
end

# println(rectcircleoverlap(c, r))
# println(rectcircleoverlap(c2, r))

# Exercise 15-4
using ThinkJulia

function drawrect(t::Turtle, r::Rectangle)
    px, py = rect.corner.x, rect.corner.y
    w, h = r.width, r.height
    dist = [h, w, h, w]
    ThinkJulia.Luxor.Reposition(t, px, py)
    for i in 1:length(dist)
        forward(t, dist[i])
        turn(t, -90)
    end
end

function ex15_4_1(rect)
    turtle = Turtle()
    @svg begin
        drawrect(turtle, rect)
    end
end

rect = Rectangle(20, 55, MPoint(-3.0, 15.0))
# ex15_4_1(rect)

function drawcircle(t::Turtle, c::Circle)
    center = c.center
    ThinkJulia.Luxor.Reposition(t, center.x, center.y)
    ThinkJulia.Luxor.Circle(t, c.radius)
end

function ex15_4_2(circ)
    turtle = Turtle()
    @svg begin
        drawcircle(turtle, circ)
    end
end

circ = Circle(Point(-3.0, 15.0), 30)
# ex15_4_2(circ)