require_relative "../../lib/game.rb"

describe Game do

  let(:game) { Game.new }

  describe '#add_ship' do
    it 'adds a ship starting at a specific coordinate' do
      expect(game.add_ship([2, 3], 'right')).to eq [[[2, 3], [3, 3], [4, 3]]]
    end

    it 'can add more than one ship' do
      game.add_ship([2, 3], 'right')
      expect(game.add_ship([3, 6], 'right')).to eq [[[2, 3], [3, 3], 
      [4, 3]], [[3, 6], [4, 6], [5, 6]]]
    end

    it 'can add ships with different sizes' do
      expect(game.add_ship(5, [2, 3], 'right')).to eq [[[2, 3], [3, 3], [4, 3], [5, 3], [6, 3]]]
    end

    it 'can choose the direction of the ship to be left' do
      expect(game.add_ship(3, [7, 3], 'left')).to eq [[[7, 3], [6, 3], [5, 3]]]
    end

    it 'can choose the direction of the ship to be up' do
      expect(game.add_ship(3, [7, 3], 'up')).to eq [[[7, 3], [7, 2], [7, 1]]]
    end

    it 'can choose the direction of the ship to be down' do
      expect(game.add_ship(3, [7, 3], 'down')).to eq [[[7, 3], [7, 4], [7, 5]]]
    end
  end

end
