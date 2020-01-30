module Result

  def game_over?(player_hit)
    if player1?(player_hit)
      "All #{@player1[:name]}'s ships are sunk. #{@player2[:name]} wins!" if @player1[:ships].all? { |ship| ship.coordinates.length == 0}
    else
      "All #{@player2[:name]}'s ships are sunk. #{@player1[:name]} wins!" if @player2[:ships].all? { |ship| ship.coordinates.length == 0}
    end
  end

end
