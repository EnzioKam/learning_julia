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