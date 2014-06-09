require "minitest/autorun"
require "dealer"
require "deck"

class DealerTest < MiniTest::Unit::TestCase
  def setup
    deck = Deck.new
    @dealer = Dealer.new(deck)
    @dealer.new_hand
  end

  def test_new_dealer_has_hand
    assert @dealer.hand.is_a?(Hand)
  end

  def test_dealer_knows_when_to_hit
    2.times { @dealer.hand.add_ace }
    @dealer.hit_til_stay
    assert_operator @dealer.hand.value , :>, 16
  end

  def test_dealer_knows_when_to_stand
    2.times { @dealer.hand.add_jack }
    @dealer.hit_til_stay
    assert_equal @dealer.hand.value, 20
  end
end
