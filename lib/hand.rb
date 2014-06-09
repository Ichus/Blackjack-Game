require "card"
require "deck"

# Not sure if i have to initialize a card object
# @hand is just an array that holds cards
# does it have to know what a card is?
# Erase after finding out
class Hand
  def initialize(deck, limit = 5, double_down_limit = 3)
    @hand = []
    @deck = deck
    @limit = limit
    @double_down_limit = double_down_limit
  end

  # access to the @hand array from outside the class. Not sure if best idea
  def show_card
    @hand
  end

  # prints the contents of the hand array
  # originally I wanted it to print all the cards on the same line, but had
  # to temporarily give up due to time constraints
  def print_hand
    # index = 0
    # until index == @hand[-1]
    #   print "#{@hand[index].print_card}, "
    #   index += 1
    # end
    # puts "#{@hand[-1].print_card}"
    @hand.each { |each| puts "#{each.print_card}" }
  end

  # @hand hits taking a card off the top of the deck and adding it to it's array
  def hit
    @hand.push(@deck.draw)
  end

  # returns the total value of the hand before aces have been acounted for
  def total_value
    total_card_value = 0
    @hand.each { |card| total_card_value += card.value }
    total_card_value
  end

  # tracks how many aces are in the hand
  def ace_count
    ace_amount = 0
    @hand.each { |card| ace_amount += 1 if card.rank == :A }
    ace_amount
  end

  # returns value of hand with aces accounted for
  def value
    hand_value = self.total_value
    num_aces = self.ace_count

    if hand_value > 21
      until hand_value <= 21 || num_aces == 0
        hand_value -= 10
        num_aces -= 1
      end
    end

    hand_value
  end

  # returns whether or not the hand is busted
  def bust
    if self.value > 21
      true
    else
      false
    end
  end

  # Not implemented. these methods would have been used to impose hand limits
  # def double_down
  #   @limit = @double_down_limit
  # end
  #
  # def limit_reached
  #   if @hand.length > @limit
  #     true
  #   else
  #     false
  #   end
  # end

  # returns whether the hand is a blackjack. Used for special blackjack payouts
  # which aren't in yet
  def blackjack?
    if @hand.length == 2 && @hand.value == 21
      true
    else
      false
    end
  end

  # For testing purposes only. Comment out
  # def add_ace
  #   @hand.push(Card.new(:A, :spades))
  # end

  # For testing purposes only. Comment out
  # def add_jack
  #   @hand.push(Card.new(:J, :spades))
  # end
end
