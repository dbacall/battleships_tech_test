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
    hit = false
    sunk = false
    player[:ships].each { |ship| 
      if ship.coordinates.include?(coordinate)
        hit = true
        ship.coordinates.delete(coordinate)
      end
      sunk = true if ship.sunk?
    }
    if hit
      if sunk
        'You hit and sunk a ship!'
      else
        "You hit a ship!"
      end
    else
      "You missed!"
    end
  end
end
