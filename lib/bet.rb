require "chip"

#
class Bet
  def initialize(bet)
    @chip = Chip.new(10)
    @total_bet = (@chip.value * bet)
    @maximum_bet = (@chip.value * 10)
  end

  # returns the total bet as credits
  def total
    @total_bet
  end

  # returns the total bet as chips
  def total_to_chips
    (@total_bet / @chip.value)
  end

  # when doubling down doubles the bet and max allowed bet
  def double_down
    @maximum_bet *= 2
    @total_bet *= 2
  end

  # returns the maximum allowed bet
  def max
    @maximum_bet
  end

  # returns whether the bet is under the maximum
  def under_max
    if @total_bet <= @maximum_bet
      true
    else
      false
    end
  end
end
