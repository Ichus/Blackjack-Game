require "base_player"

# This subclass holds dealer specific functionality
class Dealer < BasePlayer
  # the dealer hits until his hand is above 16
  def hit_til_stay
    until @hand.value > 16
      update_deck if @deck.cards_left < 1
      @hand.hit
      puts "Dealer hits"
    end
  end

  def update_deck
    @deck.build_deck.shuffle
  end
end
