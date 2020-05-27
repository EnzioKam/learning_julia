# Exercise 18-1
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

import Base.<

function <(t1::MyTime, t2::MyTime)
   return timetoint(t1) < timetoint(t2) 
end

# Alternatively
# function <(t1::MyTime, t2::MyTime)
#     return (t1.hour, t1.minute, t1.second) < (t2.hour, t2.minute, t2.second)
# end

# Exercise 18-2
const suit_names = ["♣", "♦", "♥", "♠"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

struct Card
    suit :: Int64
    rank :: Int64
    function Card(suit::Int64, rank::Int64)
        @assert(1 ≤ suit ≤ 4, "suit is not between 1 and 4")
        @assert(1 ≤ rank ≤ 13, "rank is not between 1 and 13")
        new(suit, rank)
    end
end

function Base.show(io::IO, card::Card)
    print(io, rank_names[card.rank], suit_names[card.suit])
end

function Base.isless(c1::Card, c2::Card)
    (c1.suit, c1.rank) < (c2.suit, c2.rank)
end

struct Deck
    cards :: Array{Card, 1}
end

function Deck()
    deck = Deck(Card[])
    for suit in 1:4
        for rank in 1:13
            push!(deck.cards, Card(suit, rank))
        end
    end
    deck
end

using Random

function Random.shuffle!(deck::Deck)
    shuffle!(deck.cards)
    deck
end

function Base.sort!(deck::Deck)
    sort!(deck.cards)
    deck
end

function ex18_2()
    d = Deck()
    shuffle!(d)
    println(d)
    sort!(d)
    println(d)
end

# ex18_2()

# Exercise 18-3
struct Markov
    order :: Int64
    suffixes :: Dict{Tuple{String,Vararg{String}}, Array{String, 1}}
    prefix :: Array{String, 1}
    function Markov(order::Int64=2)
        new(order, Dict{Tuple{String,Vararg{String}}, Array{String, 1}}(), Array{String, 1}())
    end
end

function processword(markov::Markov, word::String)
    if length(markov.prefix) < markov.order
        push!(markov.prefix, word)
        return
    end
    get!(markov.suffixes, (markov.prefix...,), Array{String, 1}())
    push!(markov.suffixes[(markov.prefix...,)], word)
    popfirst!(markov.prefix)
    push!(markov.prefix, word)
end

function ex18_3()
    m = Markov()
    for x in ["the", "man", "was", "as", "the", "man", "saw", ","]
        processword(m, x)
    end
    println(m)
end

# ex18_3()

# Exercise 18-5
function deal!(deck::Deck, hands::Int, size::Int)
    arr = Array{Hand, 1}()
    for j = 1:hands
        push!(arr, Hand())
    end

    for j = 1:hands
        move!(deck, arr[j], size)
    end
    return arr
end

deck = Deck()
# println(deal!(deck, 3, 5))