require_relative '../../lib/battleships.rb'

describe Battleships do

  let(:battleships) { Battleships.new }
  before(:each) do
    battleships.stub(:gets).and_return("David\n","Jim\n")
  end

  describe '#name_selection' do
    it 'asks the users to input their names' do
      expect { battleships.name_selection }.to output(
        "Welcome to Battleships!\n"\
        "Player 1 please enter your name:\n"\
        "Player 2 please enter your name:\n"\
        "Hello David and Jim. Prepare to battle.\n"
      ).to_stdout
    end
  end

  describe '#choose_ship_coordinates' do
    it 'lets users choose there ship coordinates' do
      battleships.name_selection
      battleships.stub(:gets).and_return("1\n", "1\n", "right\n", "2\n", "1\n", "right\n", "3\n", "1\n", "right\n",
      "1\n", "1\n", "right\n", "2\n", "1\n", "right\n", "3\n", "1\n", "right\n")
      expect { battleships.choose_ship_coordinates }.to output(
        player_choice_message(1, 3) + player_choice_message(1, 5) +
        player_choice_message(1, 7) + player_choice_message(2, 3) +
        player_choice_message(2, 5) + player_choice_message(2, 7)
      ).to_stdout
    end
  end

  describe '#turn' do
    it 'lets users take their turn or see their board' do
      battleships.name_selection
      battleships.stub(:gets).and_return("1\n","1\n","right\n","2\n","1\n","right\n","3\n","1\n","right\n",
      "1\n","1\n","right\n","2\n","1\n","right\n","3\n","1\n","right\n")
      battleships.choose_ship_coordinates
      battleships.stub(:gets).and_return(player_turn(1, 1), player_turn(1, 1),
      player_turn(1, 2), player_turn(1, 2), "view board", player_turn(1, 3),
      player_turn(1, 3), player_turn(2, 1), player_turn(2, 1), player_turn(2, 2), 
      player_turn(2, 2), player_turn(2, 3), player_turn(2, 8), player_turn(2, 4), 
      player_turn(2, 4), player_turn(2, 5), player_turn(2, 5), player_turn(3, 1), 
      player_turn(3, 1), player_turn(3, 2), player_turn(3, 2), player_turn(3, 3),
      player_turn(3, 3), player_turn(3, 4), player_turn(3, 4), player_turn(3, 5),
      player_turn(3, 5), player_turn(3, 6), player_turn(3, 6), player_turn(3, 7),
      player_turn(3, 7), player_turn(3, 8), player_turn(3, 8))
      expect { battleships.turn }.to output(
        ""
      ).to_stdout
    end
  end

end
