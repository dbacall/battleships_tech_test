module Shot

  def shot(coordinate, player_name)
    if player1?(player_name)
      hit?(@player1, coordinate, @player2)
    else
      hit?(@player2, coordinate, @player1)
    end
  end

  private 

  def hit?(player_hit, coordinate, player_hitting)
    @hit = false
    @sunk = false
    player_hit[:ships].each { |ship| 
      if ship.coordinates.include?(coordinate)
        @hit = true
        ship.coordinates.delete(coordinate)
      end
      if ship.sunk?
        @sunk = true 
        player_hit[:ships].delete(ship)  
      end
    }
    if @hit
      player_hitting[:board].mark_hit(coordinate)
      if @sunk
        puts 'You hit and sunk a ship!'
      else
        puts "You hit a ship!"
      end
    else
      player_hitting[:board].mark_miss(coordinate)
      puts "You missed!"
    end
  end
end
