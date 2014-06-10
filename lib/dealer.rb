require "base_player"

# This subclass holds dealer specific functionality
class Dealer < BasePlayer
  # the dealer hits until his hand is above 16
  def hit_til_stay
    @hand.hit until @hand.value > 16
  end
end
