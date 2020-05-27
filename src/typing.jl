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

abstract type CardSet end

struct Deck <: CardSet
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

struct Hand <: CardSet
    cards :: Array{Card, 1}
    label :: String
end

function Hand(label::String="")
    Hand(Card[], label)
end

function Base.show(io::IO, cs::CardSet)
    for card in cs.cards
        print(io, card, " ")
    end
end

function Base.pop!(cs::CardSet)
    pop!(cs.cards)
end

function Base.push!(cs::CardSet, card::Card)
    push!(cs.cards, card)
    nothing
end

deck = Deck()
println(deck isa CardSet)

hand = Hand()
println(hand isa CardSet)
hand = Hand("new hand")
println(hand)

function move!(cs1::CardSet, cs2::CardSet, n::Int)
    @assert 1 ≤ n ≤ length(cs1.cards)
    for i in 1:n
        card = pop!(cs1)
        push!(cs2, card)
    end
    nothing
end

function Base.sort!(hand::Hand)
    sort!(hand.cards)
end

# Run in REPL:
# @which sort!(hand)

println(supertype(Deck))
println(supertype(CardSet))
println(supertype(Card))