require_relative "../../lib/game.rb"

describe Game do

  let(:game) { Game.new("David", "Jim") }

  describe '#shot' do
    it 'tells us if we have hit our opponents ships' do
      game.add_ship(3, [3, 5], 'right', "Jim")
      expect(game.player_turn([3, 5], "Jim")).to eq 'You hit a ship!'
    end

    it 'tells us if we have missed our opponents ships' do
      game.add_ship(3, [3, 5], 'right', "Jim")
      expect(game.player_turn([8, 5], "Jim")).to eq 'You missed!'
    end
  end

end
