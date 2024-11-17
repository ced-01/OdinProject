# frozen_string_literal: true
require_relative "./lib/board"
require_relative "./lib/player"


class Game
  attr_reader :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = create_players
    @current_player = players.first
  end

  def play
    loop do

    end

  end
end

private

def create_players
  puts "Player 1, enter your name (X)"
  player1 = Player.new(gets.chomp.capitalize, "X")

  puts "player2 play with O symbol, what's your name ?"
  player2 = Player.new(gets.chomp.capitalize, "O")

  [player1, player2]
end

def display_game_state
  puts "\nCurrent board:"
  board.display_board
end

def player_turn
# Tant que la partie n'est pas finie - boucle
  loop do
    puts "#{current_player.name} choose a position (0-8):"
    position = gets.chomp

    if board.valid_position?(position)
      board.update_board(position.to_i, current_player)
      break 
    else
      puts "Invalid position. Please try again."
    end
  end
end
  
def switch_player
  @current_player = players.find{ |player| player != current_player } 
end

def game_over?
  if winner?
    puts "#{current_player.name} wins! 🎉"
    true
  elsif draw?
    puts "It's a draw! 🤝"
    true
  else
    false
  end
end

  if game.combo_winner?(current_player)
    puts "#{current_player.name} is the winner !!!"
    break
  end

  if game.full_board?
    puts "Game Over!"
    break
  end

  current_player = player2
  puts "#{current_player.name} choose your O position \n\n"

  if game.combo_winner?(current_player)
    puts "#{current_player.name} is the winner !!!"
    break
  end
end

