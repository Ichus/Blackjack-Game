# This class will store the value of a card
class Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  # Returns the card's rank
  def rank
    @rank
  end

  # Returns the card's suit
  def suit
    @suit
  end

  # Returns the cards value
  def value
    card_value = @rank
    if @rank == :A
      card_value = 11
    elsif @rank == :K || @rank == :Q || @rank == :J
      card_value = 10
    end
    card_value
  end

  # Converts the rank to be clearly printed
  def rank_for_print
    rank_print = @rank
    if @rank == :A
      rank_print = "Ace"
    elsif @rank == :K
      rank_print = "King"
    elsif @rank == :Q
      rank_print = "Queen"
    elsif @rank == :J
      rank_print = "Jack"
    end
    rank_print
  end

  # returns a string that may be printed whichever way the calling method invokes
  def print_card
    " #{self.rank_for_print} of #{@suit}"
  end

  # Used by assert_equal to determine if the value of two cards match
  # def ==(other)
  #   if @rank == other.rank && @suit == other.suit
  #     return true
  #   else
  #     return false
  #   end
  # end
end
