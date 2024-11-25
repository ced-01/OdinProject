require_relative "../lib/board.rb"

RSpec.describe Board do
  subject(:board) { Board.new }

  let(:initial_board) { Board.new }
  let(:partial_board) { Board.new.tap { |b| b.board = ["X", "O", 2, 3, "X", "O", 6, 7, "O"] } }
  let(:full_board) { Board.new.tap { |b| b.board = ["X", "O", "X", "O", "X", "O", "O", "X", "O"] } }
  let(:player_x) { instance_double("Player X", symbol: "X") }
  let(:player_o) { instance_double("Player O", symbol: "O") }

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
        " 6 | 7 | O \n"
      ).to_stdout
    end

    it "affiche une grille complète" do
      expect { full_board.display_board }.to output(
        " X | O | X \n" \
        "---+---+---\n" \
        " O | X | O \n" \
        "---+---+---\n" \
        " O | X | O \n"
      ).to_stdout
    end
  end

  describe "#valid_position?" do
    context "when position is valid and free" do
      it "returns true" do
        expect(board.valid_position?("0")).to be true
        expect(board.valid_position?("8")).to be true
    end
  end

  context "when position is already occupied" do
    before { board.update_board(0, player_x) }

    it "returns false" do
      expect(board.valid_position?("0")).to be false
    end
  end

  context "when position is invalid" do
    it "returns false for out-of-bound values" do
      expect(board.valid_position?("9")).to be false
      expect(board.valid_position?("-1")).to be false
    end

    it "returns false for non-numeric inputs" do
      expect(board.valid_position?("X")).to be false
      expect(board.valid_position?(" ")).to be false
    end
  
      it "returns false for nil input" do
        expect(board.valid_position?(nil)).to be false
      end
    end
  end


  describe "#update_board" do
      it "met à jour la grille avec le symbole du joueur" do
        initial_board.update_board(0, player_x)
        expect(initial_board.board[0]).to eq("X")
      end
    end

    describe "#full_board?" do
      it "renvoie true si la grille est pleine" do
        expect(full_board.full_board?).to eq(true)
      end
    end

    describe "#combo_winner?" do
    let (:winning_board) { Board.new }

    context "when there is a winning combination" do
      it "returns true for a row win" do
        winning_board.board = ["X", "X", "X", 3, 4, 5, 6, 7, 8]
        expect(winning_board.combo_winner?(player_x)).to be true
      end

      it "returns true for a column win" do
        winning_board.board = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
        expect(winning_board.combo_winner?(player_x)).to be true
      end

      it "returns true for a diagonal win" do
        winning_board.board = ["X", 1, 2, 3, "X", 5, 6, 7, "X"]
        expect(winning_board.combo_winner?(player_x)).to be true
      end
    end

    context "when there is no winning combination" do
      it "returns false for a partially filled board" do
        expect(partial_board.combo_winner?(double(symbol: "X"))).to be false
        expect(partial_board.combo_winner?(double(symbol: "O"))).to be false
      end

      it "returns false for an empty board" do
        expect(initial_board.combo_winner?(double(symbol: "X"))).to be false
        expect(initial_board.combo_winner?(double(symbol: "O"))).to be false
      end
    end

    context "when the board is full but no winner" do
      it "returns false" do
        expect(full_board.combo_winner?(double(symbol: "X"))).to be false
        expect(full_board.combo_winner?(double(symbol: "O"))).to be false
      end
    end
  end
end
