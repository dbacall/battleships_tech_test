class Game

  def initialize(player1_name, player2_name)
    @player1 = {name: player1_name, ships: []}
    @player2 = {name: player2_name, ships: []}
  end

  def add_ship(length, coordinate, direction, player_name)
    @ship = [coordinate]
    @index = 1
    coordinate_placer(length, coordinate, direction)
    if player1?(player_name)
      @player1[:ships] << @ship
    else
      @player2[:ships] << @ship
    end
  end

  def shot(coordinate, player_name)
    if player1?(player_name)
      if @player1[:ships].reduce(:+).include?(coordinate)
        "You hit a ship!"
      else
        "You missed!"
      end
    else
      if @player2[:ships].reduce(:+).include?(coordinate)
        "You hit a ship!" 
      else
        "You missed!"
      end
    end
  end

  private

  def coordinate_placer(length, coordinate, direction)
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
  end

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

  def player1?(name)
    name == @player1[:name]
  end

end
