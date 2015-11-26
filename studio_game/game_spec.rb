require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
  end

  it "increases the player's health by 15 when a high number (5 or 6) is rolled" do
    # Stubs out the roll method of any Die object - and makes it 5
    Die.any_instance.stub(:roll).and_return(5)

    @game.play(2)

    @player.health.should == @initial_health + (15 * 2)
  end

  it "does not change the player's health when a medium number (3 or 4) is rolled" do
    Die.any_instance.stub(:roll).and_return(4)

    @game.play(2)

    @player.health.should == @initial_health
  end

  it "decreases the player's health by 10 when a low number (1 or 2) is rolled" do
    Die.any_instance.stub(:roll).and_return(1)

    @game.play(2)

    @player.health.should == @initial_health - (10 * 2)
  end
  
  it "assigns a treasure for points during a player's turn" do
    game = Game.new("Knuckleheads")
    player = Player.new("moe")

    game.add_player(player)

    game.play(1)

    player.points.should_not be_zero
  end

  it "computes total points as the sum of all player points" do
    game = Game.new("Knuckleheads")

    player1 = Player.new("moe")
    player2 = Player.new("larry")

    game.add_player(player1)
    game.add_player(player2)

    player1.found_treasure(Treasure.new(:hammer, 50))
    player1.found_treasure(Treasure.new(:hammer, 50))
    player2.found_treasure(Treasure.new(:crowbar, 400))

    game.total_points.should == 500
end


end
