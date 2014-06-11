require "card"

#
class Deck
  include Enumerable

  attr_reader :decks

  def initialize(decks = 1)
    @suits = [:clubs, :diamonds, :hearts, :spades]
    @ranks = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    @decks = decks
    build_deck
  end

  # Rebuilds a/the deck(s) in a standard order.
  # Called once in initialization and may be called again if the deck runs out
  def build_deck
    @deck = []
    @decks.times do
      @suits.each { |each_suit| @ranks.each { |each_rank|  @deck.push(Card.new(each_rank, each_suit)) } }
    end
  end

  # draws a card off the top of the deck and returns it
  def draw
    @deck.shift
  end

  # returns the number of cards left in the deck
  def cards_left
    @deck.length
  end

  # shuffles the contents of deck
  def shuffle
    @deck.shuffle! # Contents of @deck will be permanently changed
  end

  def each
    @deck.each do |card|
      yield card
    end
  end
end
