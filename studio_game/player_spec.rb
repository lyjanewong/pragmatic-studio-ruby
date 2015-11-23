require_relative 'player'

describe Player do

  before do
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
    # By default, stdout is set to an input/ouput object that prints to the console
    # This code assigns it to a different object, StringIO
    # StringIO reads and writes to strings instead of the console
    # so the blam and w00t results aren't printed in the RSpec results
    # It is placed in the before block as we don't want to override standard output when the game runs
    $stdout = StringIO.new
  end 

  it "has a capitalized name" do
    @player.name.should == "Larry"
  end

  it "has an initial health" do
    @player.health.should == 150
  end

  context "has a health value greater than 100" do

    before do
      @player = Player.new("newbie", 150)
    end

    it "is a strong player" do
      #RSpec calls strong? method and using should, checks if it returns true
      @player.should be_strong
    end

  end

  context "has a health value less than or equal to 100" do

    before do
      @player = Player.new("newbie", 100)
    end

    it "is a wimpy player" do
      @player.should_not be_strong
    end

  end

  it "has a string representation" do
    @player.to_s.should == "I'm Larry with a health of 150 and a score of 155."
  end

  it "computes a score as the sum of its health and length of name" do
    @player.score.should == (150 + 5)   
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end

  context "in a collection of players" do

    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by descending score" do
      @players.sort.should == [@player3, @player2, @player1]
    end

  end

end