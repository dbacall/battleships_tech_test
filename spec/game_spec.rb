require_relative "../lib/game.rb"

describe Game do

  let(:player1_board) { double :Board, mark_miss: '', mark_hit: '', show: 'board shown' }
  let(:player2_board) { double :Board }
  let(:game) { Game.new("David", "Jim", player1_board, player2_board) }

  describe '#add_ship' do
    it 'adds a ship starting at a specific coordinate' do
      expect(game.add_ship(3, [2, 3], 'right', "David")).to eq(
      [[2, 3], [2, 4], [2, 5]])
    end

    it 'can add more than one ship' do
      game.add_ship(3, [2, 3], 'right', "David")
      expect(game.add_ship(3, [3, 6], 'right', "David")).to eq(
      [[3, 6], [3, 7], [3, 8]])
    end

    it 'can add ships with different sizes' do
      expect(game.add_ship(5, [2, 3], 'right', "David")).to eq(
      [[2, 3], [2, 4], [2, 5], [2, 6], [2, 7]])
    end

    it 'can choose the direction of the ship to be left' do
      expect(game.add_ship(3, [7, 3], 'left', "David")).to eq(
      [[7, 3], [7, 2], [7, 1]])
    end

    it 'can choose the direction of the ship to be up' do
      expect(game.add_ship(3, [7, 3], 'up', "David")).to eq(
      [[7, 3], [6, 3], [5, 3]])
    end

    it 'can choose the direction of the ship to be down' do
      expect(game.add_ship(3, [7, 3], 'down', "David")).to eq(
      [[7, 3], [8, 3], [9, 3]])
    end

    it 'raises an error if the ship will go off the valid coordinates' do
      expect { game.add_ship(3, [1, 9], 'right', 'David') }.to raise_error("Cannot place ship on coordinates that do not exist!")
    end

    it 'raises an error if the ship will go off the valid coordinates' do
      expect { game.add_ship(3, [1, 1], 'left', 'David') }.to raise_error("Cannot place ship on coordinates that do not exist!")
    end

    it 'raises an error if the ship will go off the valid coordinates' do
      expect { game.add_ship(3, [1, 9], 'up', 'David') }.to raise_error("Cannot place ship on coordinates that do not exist!")
    end

    it 'raises an error if the ship will go off the valid coordinates' do
      expect { game.add_ship(3, [9, 1], 'down', 'David') }.to raise_error("Cannot place ship on coordinates that do not exist!")
    end
  end

  describe '#shot' do
    it 'tells us if we have hit or missed our opponents ships' do
      allow(game).to receive(:shot).and_return("You hit a ship!")
      game.add_ship(3, [3, 5], 'right', "Jim")
      expect(game.player_turn([3, 5], "Jim")).to eq 'You hit a ship!'
    end

    it 'tells us if we have missed our opponents ships' do
      allow(game).to receive(:shot).and_return("You missed!")
      game.add_ship(3, [3, 5], 'right', "Jim")
      expect(game.player_turn([8, 5], "Jim")).to eq 'You missed!'
    end
  end

  describe '#show_board' do
    it 'shows misses on your own board' do
      game.player_turn([2, 3], "Jim")
      expect(game.show_board("David")).to eq 'board shown'
    end
  end

  describe '#finished?' do
    it 'returns the winner when the game is over' do
      allow(game).to receive(:game_over?).and_return("All Jim's ships are sunk. David wins!")
      game.add_ship(3, [3, 5], 'right', "Jim")
      game.player_turn([3, 5], 'Jim')
      game.player_turn([3, 6], 'Jim')
      game.player_turn([3, 7], 'Jim')
      expect(game.finished?('Jim')).to eq "All Jim's ships are sunk. David wins!"
    end
  end
end
