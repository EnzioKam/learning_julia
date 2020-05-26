using Printf

"""
Represents the time of day.

fields: hour, minute, second
"""
struct MyTime
    hour
    minute
    second
end

# Exercise 16-1
function printtime(t::MyTime)
    @printf("%02d:%02d:%02d", t.hour, t.minute, t.second)
end

t = MyTime(23, 10, 58)
# printtime(t)

# Exercise 16-2
function isafter(t1::MyTime, t2::MyTime)
    return (t1.hour, t1.minute, t1.second) > (t2.hour, t2.minute, t2.second) 
end

# Exercise 16-3
function increment!(time, seconds)
    time.second += seconds
    dmin, time.second = divrem(time.second, 60)
    time.minute += dmin
    dhour, time.minute = divrem(time.minute, 60)
    time.hour += dhour
    time.hour %= 24
    nothing
end

# Exercise 16-4
function increment(time, seconds)
    nsecond = time.second + seconds
    dmin, nsecond = divrem(nsecond, 60)
    nminute = time.minute + dmin
    dhour, nminute = divrem(nminute, 60)
    nhour = time.hour + dhour
    nhour %= 24
    return MyTime(nhour, nminute, nsecond)
end

# Exercise 16-5
function timetoint(time)
    minutes = time.hour * 60 + time.minute
    seconds = minutes * 60 + time.second
end

function inttotime(seconds)
    (minutes, second) = divrem(seconds, 60)
    hour, minute = divrem(minutes, 60)
    MyTime(hour, minute, second)
end

function increment(time, seconds)
    return inttotime(timetoint(time) + seconds)
end

# Exercise 16-6
function multime(time::MyTime, x::Number)
    return inttotime(timetoint(time) * x)
end

# println(multime(t, 3))

function timepermile(time::MyTime, dist::Number)
    return multime(time, 1/dist)
end

# println(timepermile(t, 3))

# Exercise 16-7
using Dates

td = today()
println(td)
println(dayofweek(td))
println(dayname(td))

function age(bday)
    td = today()
    td - bday
    dyear = year(td) - year(bday)
    dmonth = month(td) - month(bday)
    dday = day(td) - day(bday)
    if dmonth < 0
        dyear -= 1
    elseif dmonth == 0 && dday < 0
        dyear -= 1
    end
    println("Age: $dyear")

    next_bday = bday + Year(dyear + 1)
    println("Next birthday: $next_bday")
    nextdiff = DateTime(next_bday) - now()
    timeleft = canonicalize(Dates.CompoundPeriod(nextdiff))
    println("Time to next birthday: $timeleft")
end

# age(Date(1995, 11, 02))

function doubleday(d1, d2)
    @assert(d2 > d1, "d2 should be later than d1")
    return d2 - d1 + d2
end

d1 = Date(2000, 1, 2)
d2 = Date(2005, 6, 24)
# println(doubleday(d1, d2))

function n_day(d1, d2, n)
    @assert(d2 > d1, "d2 should be later than d1")
    diff = d2 - d1
    age1, age2 = diff.value, 0
    while age2 * n != age1
        if age2 * n > age1
            error("Impossible combination of inputs")
        end
        age1 += 1
        age2 += 1
    end
    return d1 + Day(age1)
end

# println(n_day(d1, d2, 2))
# println(n_day(d1, d2, 3))
# println(n_day(d1, d2, 6))