using ThinkJulia

turtle = Turtle()
@svg begin
    forward(turtle, 100)
end

turtle = Turtle()
@svg begin
    forward(turtle, 100)
    turn(turtle, -90)
    forward(turtle, 100)
end

turtle = Turtle()
@svg begin
    for i in 1:4
        forward(turtle, 100)
        turn(turtle, -90)
    end
end

function polygon(t, n, len)
    angle = 360 / n
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

function circle(t, r)
    circumference = 2 * pi * r
    n = trunc(circumference / 3) + 3
    len = circumference / n
    polygon(t, n, len)
end

function polyline(t, n, len, angle)
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

function polygon(t, n, len)
    angle = 360 / n
    polyline(t, n, len, angle)
end

function arc(t, r, angle)
    arc_len = 2 * π * r * angle / 360
    n = trunc(arc_len / 3) + 1
    step_len = arc_len / n
    step_angle = angle / n
    polyline(t, n, step_len, step_angle)
end

function circle(t, r)
    arc(t, r, 360)
end