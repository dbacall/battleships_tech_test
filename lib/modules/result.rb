module Result

  def game_over?(player_hit)
    if player1?(player_hit)
      if @player1[:ships].all? { |ship| ship.coordinates.length.zero? }
        winner_message(@player2, @player1)
      end
    else
      if @player2[:ships].all? { |ship| ship.coordinates.length.zero? }
        winner_message(@player1, @player2)
      end
    end
  end

  private

  def winner_message(winner, loser)
    puts "All #{loser[:name]}'s ships are sunk.#{winner[:name]} wins!"
  end
end
