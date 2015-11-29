# Bonus: Create more types of players with unique behaviours

require_relative 'player'
require_relative 'warrior_player'
require_relative 'treasure_trove'
require_relative 'die'

describe WarriorPlayer do

  before do
    @initial_health = 100
    @player = WarriorPlayer.new("warrior", @initial_health)
    @player.found_treasure(Treasure.new(:hammer, 50))
  end

  it "does not get blammed if carrying a hammer" do
    @player.blam
    @player.health.should == @initial_health
  end

  it "has high energy" do
    @player.should be_full_of_energy
  end

  context "blammed 3 times" do

    before do
      1.upto(4) { @player.blam }
    end

    it "has low stamina" do
      @player.should be_low_stamina
    end

    it "can only deflect 1/2 blam damage after being blammed more than 3 times" do
      @player.health.should == @initial_health - 5
    end

  end

end
