require "minitest/autorun"
require "chip"

class ChipTest < MiniTest::Unit::TestCase
  def test_chip_has_value
    value = 10
    chip = Chip.new(value)
    assert_equal chip.value, value
  end
end
