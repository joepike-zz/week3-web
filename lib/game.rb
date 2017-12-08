require_relative 'player'

class Game

  attr_reader :player1, :player2

  def initialize(player_1_name, player_2_name)
    @player1 = Player.new(player_1_name)
    @player2 = Player.new(player_2_name)
  end

  def attack(player)
    player.receive_damage
  end

end
