require "minitest/autorun"
require "deck"

class DeckTest < MiniTest::Unit::TestCase
  def setup
    @decks = 3
    @deck = Deck.new(@decks)
  end

  def test_new_deck_knows_how_many_decks_its_made_of
    assert_equal @deck.decks, @decks

  def test_new_deck_has_cards_in_increments_of_52
    assert_equal @deck.cards_left, (52 * @decks)
  end

  # A new deck should be in the order:
  # - A, 2..10, J, Q, K of clubs
  # - A, 2..10, J, Q, K of diamonds
  # - A, 2..10, J, Q, K of hearts
  # - A, 2..10, J, Q, K of spades
  def test_new_deck_is_in_order
    @decks.times do
      card = @deck.draw
      assert_equal card, Card.new(:A, :clubs)

      card = @deck.draw
      assert_equal card, Card.new(2, :clubs)

      11.times { @deck.draw }

      card = @deck.draw
      assert_equal card, Card.new(:A, :diamonds)

      12.times { @deck.draw }

      card = @deck.draw
      assert_equal card, Card.new(:A, :hearts)

      12.times { @deck.draw }

      card = @deck.draw
      assert_equal card, Card.new(:A, :spades)

      11.times { @deck.draw }

      card = @deck.draw
      assert_equal card, Card.new(:K, :spades)
    end
  end

  def test_deck_knows_how_many_are_left
    assert_equal @deck.cards_left, (52 * decks)

    30.times { @deck.draw }

    assert_equal @deck.cards_left, ((52 * decks) - 30)
  end

  def test_empty_deck_returns_nil_on_draw
    draw = (52 * decks)

    draw.times { @deck.draw }

    assert_nil @deck.draw
  end

  def test_deck_can_be_shuffled
    shuffled_deck = @deck.shuffle
    refute_equal @deck, shuffled_deck
  end
end
