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
      # to_i renvoi 0 pour une chaîne de caractére - Probléme
      # Verifie que position est un chiffre compris entre 0 et 8 - Solution
    if position.match?(/^[0-8]$/)
      position = position.to_i
      # Si la case du jeux est un integer alors la case est disponible,
      # et renvoie true 
      board[position].match?(/^\d$/)
    else
      false
    end
  end

  def updated_board(position, current_player)
    board[position] = current_player.symbol
  end  
end