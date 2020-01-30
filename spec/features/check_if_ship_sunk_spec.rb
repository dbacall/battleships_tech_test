require_relative '../../lib/ship.rb'

describe Ship do

  describe '#sunk?' do
    it "returns false" do
      ship = Ship.new([[1,2], [2,2]])
      expect(ship.sunk?).to eq false
    end
  end

end
