require "card"

#
class Deck
  def initialize(decks = 1)
    @suits = [:clubs, :diamonds, :hearts, :spades]
    @ranks = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    @decks = decks
    self.build_deck
    # See contents of @deck -for testing- Remove before push
    # @deck.each { |i| puts "Index #{@deck.find_index(i)} holds #{i.rank}, #{i.suit}" }
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
    card = @deck.shift
    card
  end

  # returns the number of cards left in the deck
  def cards_left
    left = @deck.length
    left
  end

  # shuffles the contents of deck
  def shuffle
    @deck.shuffle! # Contents of @deck will be permanently changed
  end

  # returns the number of decks used to build the Deck object
  def decks
    @decks
  end
end
