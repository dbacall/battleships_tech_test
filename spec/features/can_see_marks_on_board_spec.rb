require_relative '../../lib/game.rb'

describe Game do

  let(:game) { Game.new("David", "Jim") }

  describe '#show_board' do
    it 'shows misses on your own board' do
      game.player_turn([2, 3], "Jim")
      expect { game.show_board("David") }.to output(
        "  1 2 3 4 5 6 7 8 9\n"\
        "1 x x x x x x x x x\n"\
        "2 x x m x x x x x x\n"\
        "3 x x x x x x x x x\n"\
        "4 x x x x x x x x x\n"\
        "5 x x x x x x x x x\n"\
        "6 x x x x x x x x x\n"\
        "7 x x x x x x x x x\n"\
        "8 x x x x x x x x x\n"\
        "9 x x x x x x x x x\n"
        ).to_stdout
    end
  end

end
