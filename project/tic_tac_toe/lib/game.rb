game = Board.new

puts "player_1 play with X symbol & start, what's your name ?"
name = gets.chomp.capitalize
player_1 = Player.new(name, "X")

#Joueur 2
puts "player_2 play with O symbol, what's your name ?"
name = gets.chomp.capitalize
player_2 = Player.new(name, "O")

# Tant que la partie n'est pas finie - boucle
loop do
  current_player = player_1
  puts "#{player_1.name} choose your X position \n"
  game.display_board

  # obliger le joueur 1 a entrer une valeur valide
  loop do
    position = gets.chomp
    if game.valid_position?(position, current_player)
      game.updated_board(position, current_player)
      break 
    end
  end

  current_player = player_2
  puts "#{player_2.name} choose your O position \n"

  # obliger le joueur 2 a entrer une valeur valide
  loop do
    position = gets.chomp
    if game.valid_position?(position, current_player)
      game.updated_board(position, current_player) 
      break
    end
  end
end

