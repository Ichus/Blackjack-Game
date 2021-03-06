# This class will store the value of a card
class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
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
    case @rank
    when :A then rank_print = "Ace"
    when :K then rank_print = "King"
    when :Q then rank_print = "Queen"
    when :J then rank_print = "Jack"
    end
    rank_print
  end

  # returns a string that may be printed whichever way the calling method invokes
  def print_card
    " #{self.rank_for_print} of #{@suit}"
  end

  # Used by assert_equal to determine if the value of two cards match
  def ==(other)
    if @rank == other.rank && @suit == other.suit
      return true
    else
      return false
    end
  end
end
