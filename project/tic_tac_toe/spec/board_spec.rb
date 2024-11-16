require_relative "../lib/board.rb"
require_relative  "../lib/player.rb"

RSpec.describe Board do
    let(:initial_board) { Board.new }
    let(:partial_board) { Board.new.tap { |b| b.board = ["X", "O", 2, 3, "X", "O", 6, 7, "X"] } }
    let(:full_board) { Board.new.tap { |b| b.board = ["X", "O", "X", "O", "X", "O", "O", "X", "X"] } }
    let(:player_x) { instance_double("Player X", symbol: "X") }
    let(:player_o) { instance_double("Player O", symbol: "O") }
    let(:winner_board) { Board.new.tap { |b| b.board = []}}


describe "#display_board" do
 it "affiche la grille initiale" do
    expect { initial_board.display_board }.to output(
      " 0 | 1 | 2 \n" \
      "---+---+---\n" \
      " 3 | 4 | 5 \n" \
      "---+---+---\n" \
      " 6 | 7 | 8 \n"
    ).to_stdout
  end


  it "affiche une grille partiellement remplie" do
    expect { partial_board.display_board }.to output(
      " X | O | 2 \n" \
      "---+---+---\n" \
      " 3 | X | O \n" \
      "---+---+---\n" \
      " 6 | 7 | X \n"
    ).to_stdout
  end

  it "affiche une grille complète" do
    expect { full_board.display_board }.to output(
      " X | O | X \n" \
      "---+---+---\n" \
      " O | X | O \n" \
      "---+---+---\n" \
      " O | X | X \n"
    ).to_stdout
  end
end

  describe "#valid_position?" do

    it "Retourne true si position est valide et la place est libre" do
      expect(initial_board.valid_position?(1)).to eq(true)
    end

    it "Retourne false si la place est occupée" do
      expect(partial_board.valid_position?(0)).to eq(false)
    end

    it "Retourne false si position est hors de la grille " do
      expect(initial_board.valid_position?(9)).to eq(false)
    end

    it "Si position n'est pas valide" do
      expect(initial_board.valid_position?("invalid")).to eq(false)
    end
  end

  describe "#update_board" do
    it "met à jour la grille avec le symbole du joueur" do
      initial_board.update_board(0, player_x)
      expect(initial_board.board[0]).to eq("X")
    end
  end

  describe "#full_board?" do
    it "Si la grille est pleine la méthode renvoie true sinon renvoie false" do
      expect(partial_board.full_board?).to eq(false)
      expect(full_board.full_board?).to eq(true)
    end
  end

  describe "#combo_winner?" do
  context "when there is a winning combination" do
    it "returns true for a row win" do
      board = Board.new
      board.board = ["X", "X", "X", "O", "O", 5, 6, 7, 8]
      expect(board.combo_winner?(player_x)).to eq(true)
    end

    it "returns true for a column win" do
      board = Board.new
      board.board = ["X", "O", 2, "X", "O", 5, "X", 7, 8]
      expect(board.combo_winner?(player_x)).to eq(true)
    end

    it "returns true for a diagonal win" do
      board = Board.new
      board.board = ["X", "O", 2, "O", "X", 5, 6, 7, "X"]
      expect(board.combo_winner?(player_x)).to eq(true)
    end
  end

  context "when there is no winning combination" do
    it "returns false for a partially filled board" do
      board = Board.new
      board.board = ["X", "O", "X", "O", "X", "O", "O", "X", 8]
      expect(board.combo_winner?(player_x)).to eq(false)
      expect(board.combo_winner?(player_o)).to eq(false)
    end

    it "returns false for an empty board" do
      board = Board.new
      expect(board.combo_winner?(player_x)).to eq(false)
      expect(board.combo_winner?(player_o)).to eq(false)
    end
  end

  context "when the board is full but no winner" do
    it "returns false" do
      board = Board.new
      board.board = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      expect(board.combo_winner?(player_x)).to eq(false)
      expect(board.combo_winner?(player_o)).to eq(false)
    end
  end
  end
end