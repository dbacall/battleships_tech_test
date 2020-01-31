def player_choice_message(player, ship_length)
  "Player #{player} please choose the starting coordinate for your ship of length #{ship_length}.\n"\
  "          First choose the row: (from 1-9)\n"\
  "Now choose the column: (from 1-9)\n"\
  "Now choose the direction: (right, left, up or down)\n"\
end

def player_turn(row, col)
  "shoot\n" + "#{row}\n" + "#{col}\n"
end
