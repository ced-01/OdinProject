require_relative "../lib/game"
require_relative "../lib/board"
require_relative "../lib/player"

RSpec.describe Game do
  # let(:game) { Game.new }

  # let(:player_x) { Player.new("Player 1", "X") }
  # let(:player_o) { Player.new("Player 2", "O") }
  # let(:board) { double("Board") }

  # before do
  #   allow(game).to receive(:board).and_return(board)
  #   allow(game).to receive(:players).and_return([player_x, player_o])
  #   allow(game).to receive(:current_player).and_return(player_x)
  # end

  # describe "#play_turn" do
  #   it "switches to the next player after a valid move" do
  #     allow(board).to receive(:valid_move?).and_return(true)
  #     allow(board).to receive(:update_board)

  #     game.play_turn("1")

  #     expect(game.current_player).to eq(player_o)
  #   end

  #   it "does not switch players if the move is invalid" do
  #     allow(board).to receive(:valid_move?).and_return(false)

  #     game.play_turn("invalid_move")

  #     expect(game.current_player).to eq(player_x)
  #   end
  # end

  # describe "#game_over?" do
  #   it "returns true if there is a winner" do
  #     allow(board).to receive(:winner?).and_return(true)

  #     expect(game.game_over?).to be true
  #   end

  #   it "returns true if the board is full and no winner" do
  #     allow(board).to receive(:full?).and_return(true)
  #     allow(board).to receive(:winner?).and_return(false)

  #     expect(game.game_over?).to be true
  #   end
  # end
end
