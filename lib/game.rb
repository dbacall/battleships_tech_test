class Game

  def initialize
    @ships = []
  end

  def add_ship(length = 3, coordinate, direction)
    @ship = [coordinate]
    @index = 1
    if direction == 'left'
      left_coordinates(length, coordinate)
    else
      right_coordinates(length, coordinate)
    end
    @ships << @ship
  end

  private

  def left_coordinates(length, coordinate)
    (length-1).times { 
      @ship << [coordinate[0] - @index, coordinate[1]]
      @index += 1
    }
  end

  def right_coordinates(length, coordinate)
    (length-1).times { 
      @ship << [coordinate[0] + @index, coordinate[1]]
      @index += 1
    }
  end

end
