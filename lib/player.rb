
class Player

  STARTING_HP = 50

  attr_accessor :name, :hitpoints

  def initialize(name, hitpoints = STARTING_HP )
    @name = name
    @hitpoints = hitpoints
  end

  def receive_damage
    @hitpoints -= 10
  end

end
