require "hand"

#
class Dealer
  def intialize
  end

  # assigns the dealer a new hand
  # the deck is passed in here rather than the initialization because I was
  # getting a strange error of Argument error 0 for 1. Even though the
  # initialization method HAD 1 parameter and I supplied 1 argument to it
  def new_hand(deck)
    @deck = deck
    @hand = Hand.new(@deck)
  end

  # returns the hand in case I ever wanted access to it from outside the class
  # not sure if it's the best idea. Might have just had it in for attempted
  # testing earlier
  def hand
    @hand
  end

  # the dealer hits until his hand is above 16
  def hit_til_stay
    @hand.hit until @hand.value > 16
  end
end
