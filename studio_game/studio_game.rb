require_relative'player'
require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("marge", 80)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)

# The decision of how the game ends is decoupled from the concept of how the game is run
# This makes the code more flexible in the long-run.
knuckleheads.play(10) do
  knuckleheads.total_points >=2000
end

knuckleheads.print_stats

