require "base_player"
require "bet"

#
class Player < BasePlayer
  attr_reader :chip_pool

  def initialize(deck, chips = 10)
    @chip_pool = chips
    @deck = deck
  end

  def bet(chips)
    if can_bet(chips)
      @chip_pool -= chips
      @bet = Bet.new(chips)
    else
      nil
    end
  end

  def can_bet(chips)
    @chip_pool >= chips
  end

  # if blackjack pays double odds (Change to 3/2 odds when ChipPool class exists)
  # otherwise adds the chips that were bet and the chips won to the chip_pool
  def won_bet
    puts "You won the hand"
    if @hand.blackjack?
      puts "Blackjack! Double Payout!!"
      @chip_pool += (@bet.total_to_chips * 3)
    else
      @chip_pool += (@bet.total_to_chips * 2)
    end
  end

  # Returns chips in case of a push
  def push_bet
    @chip_pool += @bet.total_to_chips
  end

  # Subtracts the bet amount from the chip pool to account for doubling down
  # passes this information to the bet to let it know the player doubled down
  def double_down
    @chip_pool -= @bet.total_to_chips
    @bet.double_down
  end

  def chips_remaining
    (@chip_pool * 10) # 10 is currently the value all chips. Modify if implementing ChipPool class
  end
end
