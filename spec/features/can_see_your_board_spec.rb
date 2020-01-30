require_relative '../../lib/board.rb'

describe Board do

  let(:board) { Board.new }

  describe '#show' do
    it 'puts the layout of your board' do
      expect { board.show }.to output(
      "  1 2 3 4 5 6 7 8 9\n"\
      "1 x x x x x x x x x\n"\
      "2 x x x x x x x x x\n"\
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
