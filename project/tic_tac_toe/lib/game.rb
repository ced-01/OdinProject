game = Board.new

puts "player_1 play with X symbol & start, what's your name ?"
name = gets.chomp.capitalize
player_1 = Player.new(name, "X")
puts

#Joueur 2
puts "player_2 play with O symbol, what's your name ?"
name = gets.chomp.capitalize
player_2 = Player.new(name, "O")
puts

puts
# Tant que la partie n'est pas finie - boucle
loop do
  current_player = player_1
  puts "#{player_1.name} choose your X position 0 to 8 \n\n"
  game.display_board

  # obliger le joueur 1 a entrer une valeur valide
  loop do
    position = gets.chomp
    if game.valid_position?(position)
      game.update_board(position, current_player)
      game.display_board
      break 
    end
  end

  if game.combo_winner?(current_player)
    puts "#{current_player} is the winner !!!"
    break
  end

  if game.full_board?
    puts "Game Over!"
    break
  end

  current_player = player_2
  puts "#{player_2.name} choose your O position \n\n"

  # obliger le joueur 2 a entrer une valeur valide
  loop do
    position = gets.chomp
    if game.valid_position?(position)
      game.update_board(position, current_player)
      game.display_board
      break
    end
  end

  if game.combo_winner?(current_player)
    puts "#{current_player.name} is the winner !!!"
    break
  end
end

