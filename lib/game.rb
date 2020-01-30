require_relative "./modules/shot.rb"
require_relative "./modules/result.rb"
require_relative "./ship.rb"
require_relative "./board.rb"


class Game

  include Shot
  include Result

  def initialize(player1_name, player2_name, player1_board = Board.new, player2_board = Board.new)
    @player1 = { name: player1_name, ships: [], board: player1_board }
    @player2 = { name: player2_name, ships: [], board: player2_board }
  end

  def add_ship(length, coordinate, direction, player_name)
    @ship = [coordinate]
    @index = 1
    coordinate_validator(length, coordinate, direction)
    coordinate_placer(length, coordinate, direction)
    if player1?(player_name)
      @player1[:ships] << Ship.new(@ship)
      @player1[:ships].last.coordinates
    else
      @player2[:ships] << Ship.new(@ship)
      @player2[:ships].last.coordinates
    end
  end

  def player_turn(coordinate, player_hit)
    shot(coordinate, player_hit)
  end

  def finished?(player_hit)
    game_over?(player_hit)
  end

  def show_board(name)
    if player1?(name)
      @player1[:board].show
    else
      @player2[:board].show
    end
  end

  private

  def coordinate_placer(length, coordinate, direction)
    case direction
    when 'up'
      up_coordinates(length, coordinate)
    when 'down'
      down_coordinates(length, coordinate)
    when 'left'
      left_coordinates(length, coordinate)
    else
      right_coordinates(length, coordinate)
    end
  end

  def up_coordinates(length, coordinate)
    (length - 1).times { 
      @ship << [coordinate[0] - @index, coordinate[1]]
      @index += 1
    }
  end

  def down_coordinates(length, coordinate)
    (length - 1).times { 
      @ship << [coordinate[0] + @index, coordinate[1]]
      @index += 1
    }
  end

  def left_coordinates(length, coordinate)
    (length - 1).times { 
      @ship << [coordinate[0], coordinate[1] - @index]
      @index += 1
    }
  end

  def right_coordinates(length, coordinate)
    (length - 1).times { 
      @ship << [coordinate[0], coordinate[1] + @index]
      @index += 1
    }
  end

  def player1?(name)
    name == @player1[:name]
  end

  def coordinate_validator(length, coordinate, direction)
    error_message = "Cannot place ship on coordinates that do not exist!"
    case direction
    when 'right'
      raise error_message if 10 - coordinate[1] < length
    when 'left'
      raise error_message if coordinate[1] < length
    when 'up'
      raise error_message if coordinate[0] < length
    else
      raise error_message if 10 - coordinate[0] < length
    end
  end
end
