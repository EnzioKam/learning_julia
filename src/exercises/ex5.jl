# Exercise 5-1
# Infinite recursion will terminate when stack maximum is reached.
function recurse()
    recurse()
end

# recurse()

# Exercise 5-2
function daytime()
    reftime = round(Int64, time())
    minutes, seconds = divrem(reftime, 60)
    hours, minutes = divrem(minutes, 60)
    days, hours = divrem(hours, 24)
    println("Number of days since epoch: $days")
    println("GMT Time now: $hours:$minutes:$seconds")
end

# daytime()

# Exercise 5-3
function checkfermat(a, b, c, n)
    if n > 2 && a^n + b^n == c^n
        print("Holy smokes, Fermat was wrong!")
    else
        print("No that doesn't work.")
    end
end

# checkfermat(2, 3, 4, 10)

function checkfermat()
    println("Input value for a:")
    a = parse(Int64, readline())
    println("Input value for b:")
    b = parse(Int64, readline())
    println("Input value for c:")
    c = parse(Int64, readline())
    println("Input value for n:")
    n = parse(Int64, readline())
    checkfermat(a, b, c, n)
end

# checkfermat()

# Exercise 5-4
function istriangle(a, b, c)
    return a + b > c && a + c > b && b + c > a
end

# println(istriangle(5, 4, 3))
# println(istriangle(5, 7, 6))
# println(istriangle(11, 1, 3))

function istriangle()
    println("Input value for 1st side:")
    a = parse(Int64, readline())
    println("Input value for 2nd side:")
    b = parse(Int64, readline())
    println("Input value for 3rd side:")
    c = parse(Int64, readline())
    println("istriangle(a, b, c): $(istriangle(a, b, c))")
end

# istriangle()

# Exercise 5-5
function recurse(n, s)
    if n == 0
        println(s)
    else
        recurse(n-1, n+s)
    end
end

# This prints the sum of all numbers from 1 to n.
# recurse(10, 0)
# This results in a infinite recursion.
# recurse(-1, 0)

# Exercise 5-6
using ThinkJulia

function draw(t, length, n)
    if n == 0
        return
    end
    angle = 50
    forward(t, length*n)
    turn(t, -angle)
    draw(t, length, n-1)
    turn(t, 2*angle)
    draw(t, length, n-1)
    turn(t, -angle)
    forward(t, -length*n)
end

t = turtle()
@svg begin
    draw(t, 10, 5)
end