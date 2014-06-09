require "minitest/autorun"
require "bet"

class BetTest < MiniTest::Unit::TestCase
  def setup
    @bet_amount = 3
    @chip = Chip.new(10)
    @bet = Bet.new(@bet_amount)
  end

  def test_new_bet_has_amount
    assert_equal @bet.total, (@chip.value * @bet_amount)
  end

  def test_can_convert_to_chips
    assert_equal @bet.total_to_chips ,@bet_amount
  def

  def test_bet_has_maximum
    assert_equal @bet.max, (@chip.value * 10)
  end

  def test_bet_can_double_down
    assert_equal @bet.double_down, (@bet * 2)
  end

  def test_bet_knows_when_it_exceeds_maximum
    @bet = (@bet + @bet.max)
    assert_equal @bet.under_max, false
  end
end
