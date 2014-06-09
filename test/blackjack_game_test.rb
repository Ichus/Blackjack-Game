require "minitest/autorun"
require "blackjack_game"

# Test for blackjack_game.rb
class BlackjackGameTest < MiniTest::Unit::TestCase
  def setup
    @game = BlackjackGame.new
  end

  # If given yes as input
  def test_keep_playing
    assert_equal @game.keep_playing, true
  end

  # def test_new_game_has_player
  #   assert_equal @deck.size, 52
  # end

  # def test_new_game_has_dealer
  #   assert_equal @deck.size, 52
  # end

  # def test_new_game_has_deck
  #   assert_equal @deck.size, 52
  # end

  # def test_game_has_current_round
  #   assert_equal @deck.size, 52
  # end

  # def test_game_tracks_total_rounds
  #   assert_equal @deck.size, 52
  # end

  # def test_game_knows_when_to_shuffle
  #   assert_equal @deck.size, 52
  # end
end
