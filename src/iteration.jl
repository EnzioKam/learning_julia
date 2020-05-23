n = 10
while (n > 0)
    println("Countdown: $n")
    global n = n - 1 # Loop introduces new scope
end

# println("Loop terminated.")

function countdown(n)
    while (n > 0)
        println("Countdown: $n")
        n = n - 1 # Within the same scope
    end
    println("Loop terminated.")
end

countdown(n)