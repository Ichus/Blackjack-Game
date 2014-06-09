require "minitest/autorun"
require "hand"
require "deck"

class HandTest < MiniTest::Unit::TestCase
  def setup
    @limit = 5
    @deck = Deck.new
    @hand = Hand.new(@deck, @limit)
  end

  def test_new_hand_has_cards
    2.times { @hand.hit} # May have to remove the 2.times
    assert @hand.show_card.each.is_a? Card
  end

  def test_hand_card_limit
    (@limit + 1).times {@hand.hit}
    assert_equal @hand.limit_reached, true
  end

  def test_hand_has_how_many_aces
    count = 3
    count.times { @hand.add_ace }
    assert_equal @hand.ace_count, count
  end

  def test_hand_can_convert_aces
    count = 3
    count.times { @hand.add_ace }
    assert_equal @hand.value, (11 + (count - 1))
  end

  def test_hand_has_total_value
    count = 3
    count.times { @hand.add_ace }
    assert_equal @hand.total_value, (count * 11)
  end

  def test_hand_is_blackjack
    @hand.add_ace
    @hand.add_jack
    assert @hand.blackjack?
  end

  def test_hand_can_double_down
    assert_equal @hand.double_down, 3
  end
end
