module Shot

  def shot(coordinate, player_name)
    if player1?(player_name)
      hit?(@player1, coordinate)
    else
      hit?(@player2, coordinate)
    end
  end

  private 

  def hit?(player, coordinate)
    if player[:ships].reduce(:+).include?(coordinate)
      "You hit a ship!"
    else
      "You missed!"
    end
  end
end
