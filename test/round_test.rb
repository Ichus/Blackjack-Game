require "minitest/autorun"
require "round"

# Not sure what else to test for. Everything else either displays information
# or gathers input. I could rewrite a separate class that didn't gather input
# but iterated through checkpoints of input spanning the working domain.
# However, it doesn't seem worthwhile for such a small program
class RoundTest < MiniTest::Unit::TestCase
  def setup
    @round = Round.new
  end

  def test_round_can_set_hands
    @round.set_hands
    assert_equal true, @round.dealer.hand[1].is_a?(Card)
  end
end
