require_relative "../../lib/game.rb"

describe Game do

  let(:game) { Game.new("David", "Jim") }

  describe '#player_turn' do
    it 'tells us if we have hit our opponents ships' do
      game.add_ship(3, [3, 5], 'right', "Jim")
      expect(game.player_turn([3, 5], "Jim")).to eq 'You hit a ship!'
    end

    it 'tells us if we have missed our opponents ships' do
      game.add_ship(3, [3, 5], 'right', "Jim")
      expect(game.player_turn([8, 5], "Jim")).to eq 'You missed!'
    end

    it "tells us if we have sunk the opponents ship" do
      game.add_ship(3, [3, 5], 'right', "Jim")
      game.player_turn([3, 5], "Jim")
      game.player_turn([4, 5], "Jim")
      expect(game.player_turn([5, 5], "Jim")).to eq 'You hit and sunk a ship!'
    end
  end

end
