class Ship

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def sunk?
    @coordinates.empty?
  end

end
