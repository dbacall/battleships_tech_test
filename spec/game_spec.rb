require_relative "../lib/game.rb"

describe Game do

  let(:game) { Game.new }

  describe '#add_ship' do
    it 'adds a ship starting at a specific coordinate' do
      expect(game.add_ship([2, 3])).to eq [[2, 3], [3, 3], [4, 3]]
    end
  end

end