require "hand"
require "bet"

#
class Player
  def initialize(deck, chips = 10)
    @chip_pool = chips
    @deck = deck
  end

  def new_hand
    @hand = Hand.new(@deck)
  end

  def hand
    @hand
  end

  def bet(chips)
    if self.can_bet(chips)
      @chip_pool -= chips
      @bet = Bet.new(chips)
    else
      nil
    end
  end

  def can_bet(chips)
    if @chip_pool >= chips
      true
    else
      false
    end
  end

  # if blackjack pays double odds
  # otherwise adds the chips that were bet and the chips won to the chip_pool
  def won_bet
    #if @hand.blackjack?
    #  @chip_pool += (@bet.total_to_chips * 3)
    #else
    @chip_pool += (@bet.total_to_chips * 2)
    #end
  end

  # Returns chips in case of a push
  def push_bet
    @chip_pool += @bet.total_to_chips
  end

  def double_down
    @chip_pool -= @bet.total_to_chips
    @bet.double_down
  end

  def chips_remaining
    (@chip_pool * 10) # 10 is currently the value all chips. Modify if implementing ChipPool class
  end
end
