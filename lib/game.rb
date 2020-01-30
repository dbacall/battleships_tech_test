class Game

  def initialize
    @ships = []
  end

  def add_ship(length = 3, coordinate, direction)
    @ship = [coordinate]
    @index = 1
    case direction
    when 'left'
      left_coordinates(length, coordinate)
    when 'right'
      right_coordinates(length, coordinate)
    when 'up'
      up_coordinates(length, coordinate)
    else
      down_coordinates(length, coordinate)
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

  def up_coordinates(length, coordinate)
    (length-1).times { 
      @ship << [coordinate[0], coordinate[1] - @index]
      @index += 1
    }
  end

  def down_coordinates(length, coordinate)
    (length-1).times { 
      @ship << [coordinate[0], coordinate[1] + @index]
      @index += 1
    }
  end

end
