require_relative 'game'

describe Game do

  before do
    @game = Game.new("Super Smash Bros")
    $stdout = StringIO.new
  end

  it "has a title" do
    @game.title.should == "Super Smash Bros"
  end

  it "blams player once (-10 hp), w00ts player twice (+15 hp/each) and blams player once more when play is called" do
    initial_health = 150
    player = Player.new("Lawrence", initial_health)
    @game.add_player(player)
    @game.play

    player.health.should == (initial_health - 10 + 15 + 15 - 10)
  end


end