require_relative "../lib/board.rb"
require_relative  "../lib/player.rb"

RSpec.describe Board do
    let(:initial_board) { Board.new }
    let(:partial_board) { Board.new.tap { |b| b.board = ["X", "O", 2, 3, "X", "O", 6, 7, "X"] } }
    let(:full_board) { Board.new.tap { |b| b.board = ["X", "O", "X", "O", "X", "O", "O", "X", "X"] } }

 # Test de la méthode display_board
  it 'affiche une grille initiale' do
    expect { initial_board.display_board }.to output(
      " 0 | 1 | 2 \n" \
      "---+---+---\n" \
      " 3 | 4 | 5 \n" \
      "---+---+---\n" \
      " 6 | 7 | 8 \n"
    ).to_stdout
  end


  it 'affiche une grille partiellement remplie' do
    expect { partial_board.display_board }.to output(
      " X | O | 2 \n" \
      "---+---+---\n" \
      " 3 | X | O \n" \
      "---+---+---\n" \
      " 6 | 7 | X \n"
    ).to_stdout
  end

  it 'affiche une grille complète' do
    expect { full_board.display_board }.to output(
      " X | O | X \n" \
      "---+---+---\n" \
      " O | X | O \n" \
      "---+---+---\n" \
      " O | X | X \n"
    ).to_stdout
  end

  # Test de la méthode valid_position?
  # players = Player.new("ced", "X")
  it "player_position est valide et la place est libre" do
    player_position = 1
    expect(initial_board.valid_position?(player_position)).to eq(true)
  end

  it "player_position est valide et la place est occupée" do
    player_position = 0
    expect(partial_board.valid_position?(player_position)).to eq(false)
  end

  it "player_position n'est pas dans la plage du jeux soit entre 0..8" do
    player_position = 9
    expect(initial_board.valid_position?(player_position)).to eq(false)
  end

  it "player_position n'est pas valide" do
    player_position = "invalid"
    expect(initial_board.valid_position?(player_position)).to eq(false)
  end
end