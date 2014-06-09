# This class contains the value of a chip and will be expanded if time allows
# Or more likley completely erased and replaced with the ChipPool class
class Chip
  def initialize(value)
    @chip_value = value
  end

  # returns the value of the chip
  def value
    @chip_value
  end
end
