# Exercise 4-1
using ThinkJulia

turtle = Turtle()
@svg begin
    forward(turtle, 100)
    turn(turtle, -90)
    forward(turtle, 100)
    turn(turtle, -90)
    forward(turtle, 100)
    turn(turtle, -90)
    forward(turtle, 100)
end

# Exercise 4-2
function square(t)
    @svg begin
        for i in 1:4
            forward(turtle, 100)
            turn(turtle, -90)
        end
    end
end

turtle = Turtle()
square(turtle)

# Exercise 4-3
turtle = Turtle()
@svg begin
    square(turtle)
end

# Exercise 4-4
function square(t, len)
    @svg begin
        for i in 1:4
            forward(turtle, len)
            turn(turtle, -90)
        end
    end
end

turtle = Turtle()
@svg begin
    square(turtle, 200)
end

# Exercise 4-5
function polygon(t, len, n)
    @svg begin
        for i in 1:n
            forward(turtle, len)
            turn(turtle, -360/n)
        end
    end
end

turtle = Turtle()
@svg begin
    polygon(turtle, 100, 8)
end

# Exercise 4-6
function circle(t, r)
    polygon(t, r, 30)
end

turtle = Turtle()
@svg begin
    circle(turtle, 10)
end

# Exercise 4-7
function arc(t, r, angle)
    circ = 2*pi*r
    frac = angle / 360
    arclength = circ * frac
    n = 30
    len = arclength / n
    for i in 1:n
        forward(turtle, len)
        turn(turtle, angle/n)
    end
end

turtle = Turtle()
@svg begin
    arc(turtle, 100, 235)
end
