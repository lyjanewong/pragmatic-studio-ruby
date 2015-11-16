require_relative'player'
require_relative 'game'

player1 = Player.new("moe")
player2 =Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

puts "---"

chipmunks = Game.new("Chipmunks")

player4 = Player.new("alvin")
player5 = Player.new("simon")
player6 = Player.new("theodore")

chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play