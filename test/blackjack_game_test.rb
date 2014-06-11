require "minitest/autorun"
require "blackjack_game"

# Test for blackjack_game.rb
class BlackjackGameTest < MiniTest::Unit::TestCase
  def setup
    @game = BlackjackGame.new
  end

  # Places players chip pool at zero and test that @game.play exits
  def test_play_exits_on_zero_chips
    @game.player.bet(10)
    assert_nil @game.play
  end

  # If given yes as input
  def test_keep_playing
    assert_equal @game.keep_playing, true
  end
end
