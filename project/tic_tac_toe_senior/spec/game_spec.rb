require_relative "../lib/game"
require_relative "../lib/board"
require_relative "../lib/player"

RSpec.describe Game do
  let(:board) { instance_double(Board) }
  let(:player_x) { Player.new("Alice", "X") }
  let(:player_o) { Player.new("Bob", "O") }
  let(:game) { Game.new }

  before do
    allow(game).to receive(:board).and_return(board)
    allow(game).to receive(:players).and_return([player_x, player_o])
    allow(game).to receive(:current_player).and_return(player_x)
  end

  describe "#game_over?" do
    it "returns true if there is a winner" do
      allow(board).to receive(:combo_winner?).with(player_x).and_return(true)

      expect(game.game_over?).to be true
    end

    it "returns true if the board is full and no winner" do
      allow(board).to receive(:combo_winner?).with(player_x).and_return(false)
      allow(board).to receive(:full_board?).and_return(true)

      expect(game.game_over?).to be true
    end

    it "returns false if the game is not over" do
      allow(board).to receive(:combo_winner?).with(player_x).and_return(false)
      allow(board).to receive(:full_board?).and_return(false)

      expect(game.game_over?).to be false
    end
  end
end
