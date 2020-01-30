require_relative "../lib/game.rb"

describe Game do

  let(:game) { Game.new("David", "Jim") }

  describe '#add_ship' do
    it 'adds a ship starting at a specific coordinate' do
      expect(game.add_ship(3, [2, 3], 'right', "David")).to eq [[[2, 3], [3, 3], [4, 3]]]
    end

    it 'can add more than one ship' do
      game.add_ship(3, [2, 3], 'right', "David")
      expect(game.add_ship(3, [3, 6], 'right', "David")).to eq [[[2, 3], [3, 3], [4, 3]], 
      [[3, 6], [4, 6], [5, 6]]]
    end

    it 'can add ships with different sizes' do
      expect(game.add_ship(5, [2, 3], 'right', "David")).to eq [[[2, 3], [3, 3], [4, 3], [5, 3], [6, 3]]]
    end

    it 'can choose the direction of the ship to be left' do
      expect(game.add_ship(3, [7, 3], 'left', "David")).to eq [[[7, 3], [6, 3], [5, 3]]]
    end

    it 'can choose the direction of the ship to be up' do
      expect(game.add_ship(3, [7, 3], 'up', "David")).to eq [[[7, 3], [7, 2], [7, 1]]]
    end

    it 'can choose the direction of the ship to be down' do
      expect(game.add_ship(3, [7, 3], 'down', "David")).to eq [[[7, 3], [7, 4], [7, 5]]]
    end
  end

end
