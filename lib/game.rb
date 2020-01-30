class Game

  def initialize
    @ships = []
  end

  def add_ship(length = 3, coordinate)
    ship = [coordinate]
    i = 1
    (length-1).times { 
      ship << [coordinate[0] + i, coordinate[1]]
      i += 1
    }
    @ships << ship
  end

end
