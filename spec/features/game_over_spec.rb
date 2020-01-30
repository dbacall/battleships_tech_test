require_relative '../../lib/game.rb'

describe Game do

  let(:game) { Game.new("David", "Jim") }

  describe '#game_over?' do
    it 'returns the winner when the game is over' do
      game.add_ship(3, [3, 5], 'right', "Jim")
      game.player_turn([3, 5], 'Jim')
      game.player_turn([3, 6], 'Jim')
      game.player_turn([3, 7], 'Jim')
      expect(game.finished?('Jim')).to eq "All Jim's ships are sunk. David wins!"
    end
  end

end
