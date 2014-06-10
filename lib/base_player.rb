require "hand"

# Superclass of Player and Dealer Classes
class BasePlayer
  attr_reader :hand

  def initialize(deck)
    @deck = deck
  end

  # assigns a new hand
  def new_hand
    @hand = Hand.new(@deck)
  end
end
