require 'test_helper'

class ConnectFour::GameTest < ConnectFourSpec
  describe ConnectFour::Game do
    let(:game) { ConnectFour::Game.new }
    let(:board) { game.board }


    it("responds to board"){ game.must_respond_to :board }

    describe "#display_board" do
      it "displays the board on the terminal" do
        proc { game.display_board }.must_output game.board.stringified
      end
    end

    describe "#prompt_for_input" do
      it "puts out player x > for x" do
        proc { game.prompt_for_input "x" }.must_output "player x >"
      end
      it "puts out player o > for o" do
        proc { game.prompt_for_input "o" }.must_output "player o >"
      end
    end

    end
    describe "#there_is_a_winner?" do
      it "is false initially" do
        game.there_is_a_winner?(2,2).must_equal false
      end
      it "is true if the just entered stone makes a quartet" do
        setup_fields [[4,0],[4,1],[4,2],[4,3]], 'x'
        game.there_is_a_winner?(4, 2).must_equal true
      end
      it "is false if the just entered stone doesn't make a quartet" do
        setup_fields [[4,0],[4,2],[4,3]], 'x'
        game.there_is_a_winner?(4, 2).must_equal false
      end
    end

  end
end
