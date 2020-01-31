require_relative './game.rb'

class Battleships

  def name_selection
    puts "Welcome to Battleships!"
    puts "Player 1 please enter your name:"
    @player1 = gets.chomp
    puts "Player 2 please enter your name:"
    @player2 = gets.chomp
    puts "Hello #{@player1} and #{@player2}. Prepare to battle."
    @game = Game.new(@player1, @player2)
  end

  def choose_ship_coordinates
    ship_length = 3
    player_number = 1
    while player_number < 3 do
      while ship_length <= 7 do
        begin
          puts "Player #{player_number} please choose the starting coordinate for your ship of length #{ship_length}.
          First choose the row: (from 1-9)"
          row = gets.chomp.to_i
          puts "Now choose the column: (from 1-9)"
          col = gets.chomp.to_i
          puts "Now choose the direction: (right, left, up or down)"
          direction = gets.chomp
          if player_number == 1
            @game.add_ship(ship_length, [row, col], direction, @player1)
          else
            @game.add_ship(ship_length, [row, col], direction, @player2)
          end
        rescue RuntimeError => e
          puts e        
          ship_length -= 2
        end 
        ship_length += 2
      end
      player_number += 1
      ship_length = 3
    end
  end

  def turn
    turn = 1
    while @game.finished?(@player1) == nil && @game.finished?(@player2) == nil do
      if turn.odd?
        @attacker = @player1
        @defender = @player2
      else
        @attacker = @player2
        @defender = @player1
      end
      puts "It's your turn #{@attacker}. Do you want to shoot or view your board?(type shoot or view board)"
      choice = gets.chomp
      @game.show_board(@attacker) if choice == 'view board'
        
      puts "Where do you want to shoot? First select a row: (from 1-9)"
      row = gets.chomp.to_i
      puts "Now choose the column: (from 1-9)"
      col = gets.chomp.to_i

      @game.player_turn([row, col], @defender)
      turn += 1
    end
    @game.finished?(@defender)
  end
end
