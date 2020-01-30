require_relative "../../lib/game.rb"

describe Game do

  let(:game) {Game.new("David", "Jim")}

  describe '#shot' do
    it 'tells us if we have hit or missed our opponents ships' do
      game.add_ship(3, [3, 5], 'right', "Jim")
      expect(game.shot([3, 5], "Jim")).to eq 'You hit a ship!'
    end
  end

end
