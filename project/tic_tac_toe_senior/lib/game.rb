# frozen_string_literal: true
require_relative "./board"
require_relative "./player"


class Game
  attr_reader :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = create_players
    @current_player = players.first
  end

  def play
    loop do
      display_game_state
      player_turn
      break if game_over?

      switch_player
    end
  end

  private

  def create_players
    puts "Player 1, enter your name (X):"
    player1 = Player.new(gets.chomp.capitalize, "X")
    puts "player 2, enter your name (O):"
    player2 = Player.new(gets.chomp.capitalize, "O")
    [player1, player2]
  end

  def display_game_state
    puts "\nCurrent board:"
    board.display_board
  end

  def player_turn
    puts "#{current_player.name} choose a position (0-8):"
    position = nil

    loop do
      position = gets.chomp
      break if board.valid_position?(position)

      puts "Invalid position. Please try again."
    end
    board.update_board(position.to_i, current_player)
  end
    
  def switch_player
    @current_player = players.find{ |player| player != current_player } 
  end

  def game_over?
    if board.combo_winner?(current_player)
      puts "#{current_player.name} wins! 🎉"
      true
    elsif board.full_board?
      puts "It's a draw! 🤝"
      true
    else
      false
    end
  end
end