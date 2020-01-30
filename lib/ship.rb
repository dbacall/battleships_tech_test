class Ship

  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def sunk?
    @coordinates.empty?
  end

end
