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
    # Convertit `position` en chaîne pour permettre l'utilisation de `match?`
    position = position.to_s

    # Vérifie que la position est bien un chiffre unique de 0 à 8
    # Evite une conversion de string en integer qui fait 0.
    if position.match?(/^[0-8]$/) 
      position = position.to_i
      board[position].match?(/^\d$/)
    else
      puts "Not possible ! Start again !!!"
      false
    end
  end

  def update_board(position, current_player)
    position = position.to_i
    board[position] = current_player.symbol
  end  

  def full_board?
    board.all? { |position| position == "O" || position == "X" }
  end

  def combo_winner?(current_player)
    winner_index = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
            [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ].freeze

    winner_index.any? do |combination|
      combination.all? { |index| board[index] == current_player.symbol }

    end
  end
end