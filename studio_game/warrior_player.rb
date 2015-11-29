# Bonus: Create more types of players with unique behaviours

require_relative 'player'
require_relative 'treasure_trove'
require_relative 'die'

class WarriorPlayer < Player

  def initialize(name, health=100)
    super(name, health)
    @blam_count = 0
  end

  def has_hammer?
    @found_treasures.key?(:hammer)
  end

  def full_of_energy?
    @blam_count <= 3
  end

  def low_stamina?
    @blam_count > 3
  end

  def blam
    @blam_count += 1
    if (has_hammer? && full_of_energy?)
      puts "#{name} deflected the blam with his mighty hammer!"
    elsif (has_hammer? && low_stamina?) 
      @health -= 5
      puts "#{name} is tired and deflected only half the blam."
    else
      super
    end
  end

end

if __FILE__ == $0
  warrior = WarriorPlayer.new("warrior", 100)

  hammer = Treasure.new(:hammer, 50)
  crowbar = Treasure.new(:crowbar, 400)
  warrior.found_treasure(hammer)
  warrior.found_treasure(crowbar)

  puts @found_treasure

  warrior.blam
  puts warrior.health

  warrior.blam
  warrior.blam
  warrior.blam
  puts warrior.health
  warrior.blam
  puts warrior.health

end