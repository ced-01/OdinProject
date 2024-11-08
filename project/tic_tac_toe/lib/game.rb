# Initialisation d'une partie
game = HumanPlayers.new
loop do
  puts "Do you want play a game? [Yes/No]"
  answer = gets.chomp.upcase

  case answer
  when "Y", "YES"
    puts "Player 1 with #{game.current_player} start: choose where to place X ? [1..9]"
    display_board()
    break
  when "Q", "QUIT", "NO", "N"
    exit
  else
    puts "sorry choose Yes or No or Quit ?"
  end
end

# Joueur 1 joue
 player = game.current_player
 puts "enter your choice"
 move = gets.chomp.downcase
 if player == "X" 
  display_board(board[move] = player)
 end
 p display_board
# Joueur 2 joue