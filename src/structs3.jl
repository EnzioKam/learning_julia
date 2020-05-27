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

import Base.<

function <(c1::Card, c2::Card)
    (c1.suit, c1.rank) < (c2.suit, c2.rank)
end

# For sorting, define isless instead of <. < will depend on isless.

c1 = Card(2, 3)
c2 = Card(4, 5)
println(c1)
println(c2)
println(c1 < c2)

using Test

@test Card(1, 4) < Card(2, 4)
@test Card(1, 3) < Card(1, 4)
# This will flag an error from failed test
# @test Card(1, 4) > Card(2, 4)

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

function Base.show(io::IO, deck::Deck)
    for card in deck.cards
        print(io, card, " ")
    end
    println()
end

println(Deck())

function Base.pop!(deck::Deck)
    pop!(deck.cards)
end

function Base.push!(deck::Deck, card::Card)
    push!(deck.cards, card)
    deck
end

using Random

function Random.shuffle!(deck::Deck)
    shuffle!(deck.cards)
    deck
end