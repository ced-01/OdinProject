# Joueurs X et O
class HumanPlayers
  attr_accessor :current_player

  def initialize(player_1 = "X", player_2 = "O")
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1 
  end
end