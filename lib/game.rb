require_relative "./modules/shot.rb"
require "ship"

class Game

  include Shot

  def initialize(player1_name, player2_name, player1_board = Board.new, player2_board = Board.new)
    @player1 = { name: player1_name, ships: [], board: player1_board }
    @player2 = { name: player2_name, ships: [], board: player2_board }
  end

  def add_ship(length, coordinate, direction, player_name)
    @ship = [coordinate]
    @index = 1
    coordinate_placer(length, coordinate, direction)
    if player1?(player_name)
      @player1[:ships] << Ship.new(@ship)
      @player1[:ships].last.coordinates
    else
      @player2[:ships] << Ship.new(@ship)
      @player2[:ships].last.coordinates
    end
  end

  def player_turn(coordinate, player_name)
    shot(coordinate, player_name)
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
    (length - 1).times { 
      @ship << [coordinate[0] - @index, coordinate[1]]
      @index += 1
    }
  end

  def right_coordinates(length, coordinate)
    (length - 1).times { 
      @ship << [coordinate[0] + @index, coordinate[1]]
      @index += 1
    }
  end

  def up_coordinates(length, coordinate)
    (length - 1).times { 
      @ship << [coordinate[0], coordinate[1] - @index]
      @index += 1
    }
  end

  def down_coordinates(length, coordinate)
    (length - 1).times { 
      @ship << [coordinate[0], coordinate[1] + @index]
      @index += 1
    }
  end

  def player1?(name)
    name == @player1[:name]
  end

end
