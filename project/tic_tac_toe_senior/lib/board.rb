class Board
  attr_accessor :board

  def initialize
    @board = (0..8).map(&:to_s)
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "---+---+---"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "---+---+---"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def valid_position?(position)
    return false if position.nil? || !position.is_a?(String)
    return false unless position.match?(/^\d$/)

    position = position.to_i
     # vérifie si la case libre est libre 
    position.between?(0, 8) && board[position].match?(/^\d$/)
  end

  def update_board(position, current_player)
    board[position] = current_player.symbol
  end  

  def full_board?
    board.none? { |cell| cell.match?(/^\d$/) }
  end

  def combo_winner?(current_player)
    winning_combinations.any? do |combination|
      combination.all? { |index| board[index] == current_player.symbol }
    end
  end

  private

  def winning_combinations
    [ 
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]
  end
end