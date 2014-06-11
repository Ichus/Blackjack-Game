# This class contains the value of a chip and will be expanded if time allows
# Or more likley completely erased and replaced with the ChipPool class
class Chip
  attr_reader :value

  def initialize(chip_value)
    @value = chip_value
  end
end
