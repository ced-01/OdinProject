# frozen_string_literal: true

# deux joueurs sont nécessaires
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end