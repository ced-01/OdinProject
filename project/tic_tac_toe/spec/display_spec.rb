require_relative "../lib/display.rb"
# si module §§§§§§ include "moduleName" ICI

RSpec.describe "display_board" do
  let(:board_initial) { [0, 1, 2, 3, 4, 5, 6, 7, 8] }
  let(:board_in_progress) { ["X", "O", "X", 3, "X", "O", 6, 7, "X"] }
  let(:board_full) { ["X", "O", "X", "X", "O", "X", "O", "X", "O"] }

  it 'affiche une grille initiale' do
    expect { display_board(board_initial) }.to output(
      " 0 | 1 | 2 \n" \
      "---+---+---\n" \
      " 3 | 4 | 5 \n" \
      "---+---+---\n" \
      " 6 | 7 | 8 \n"
    ).to_stdout
  end

  it 'affiche une grille partiellement remplie' do
    expect { display_board(board_in_progress) }.to output(
      " X | O | X \n" \
      "---+---+---\n" \
      " 3 | X | O \n" \
      "---+---+---\n" \
      " 6 | 7 | X \n"
    ).to_stdout
  end

  it 'affiche une grille complète' do
    expect { display_board(board_full) }.to output(
      " X | O | X \n" \
      "---+---+---\n" \
      " X | O | X \n" \
      "---+---+---\n" \
      " O | X | O \n"
    ).to_stdout
  end
end