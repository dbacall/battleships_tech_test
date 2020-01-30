class Game

  def initialize
    @ships = []
  end

  def add_ship(coordinate)
    ship = [coordinate]
    i = 1
    2.times { 
      ship << [coordinate[0] + i, coordinate[1]]
      i += 1
    }
    @ships << ship
  end

end
