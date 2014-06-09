require "minitest/autorun"
require "card"

class CardTest < MiniTest::Unit::TestCase
  def test_that_card_has_a_suit
    card = Card.new(:A, :spades)
    assert_equal card.suit, :spades
  end

  def test_that_card_has_a_rank
    card = Card.new(:A, :spades)
    assert_equal card.rank, :A
  end

  def test_that_card_knows_value
    ace = Card.new(:A, :spades)
    assert_equal ace.value, 11

    jack = Card.new(:J, :hearts)
    assert_equal jack.value, 10

    seven = Card.new(7, :diamonds)
    assert_equal seven.value, 7
  end
end
