require_relative'player'
require_relative 'game'

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  rounds = gets.chomp.downcase

  case rounds

  when /^\d+$/
    # The decision of how the game ends is decoupled from the concept of how the game is run
    # This makes the code more flexible in the long-run.
    knuckleheads.play(rounds.to_i) do
      knuckleheads.total_points >=2000
    end 

  when 'quit', 'exit'
    knuckleheads.print_stats
    break

  else
    puts "Please enter a number or 'quit' to exit"

  end

end

knuckleheads.save_high_scores
