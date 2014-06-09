require "minitest/autorun"
require "player"
require "deck"

class PlayerTest < MiniTest::Unit::TestCase
  def setup
    deck = Deck.new
    @player = Player.new(deck)
    @player.new_hand
  end

  def test_player_has_hand
    assert @player.hand.is_a?(Hand)
  end

  def test_player_has_chip_pool
    assert_equal @player.chips_remaining, 10
  end

  def test_player_can_make_bet
    assert @player.bet(5).is_a?(Bet)
  end

  def test_player_can_win_bet
    @player.won_bet(3)
    assert_equal @player.chips_remaining, 13
  end
end
