require_relative "../lib/game.rb"

describe Game do

  let(:game) { Game.new }

  describe '#add_ship' do
    it 'adds a ship starting at a specific coordinate' do
      expect(game.add_ship([2, 3])).to eq [[[2, 3], [3, 3], [4, 3]]]
    end

    it 'can add more than one ship' do
      game.add_ship([2, 3])
      expect(game.add_ship([3, 6])).to eq [[[2, 3], [3, 3], [4, 3]], 
      [[3, 6], [4, 6], [5, 6]]]
    end

    it 'can add ships with different sizes' do
      expect(game.add_ship(5, [2, 3])).to eq [[[2, 3], [3, 3], [4, 3], [5, 3], [6, 3]]]
    end
  end

end
