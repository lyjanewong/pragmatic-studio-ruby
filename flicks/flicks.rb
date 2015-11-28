require_relative 'playlist'

movie1 = Movie.new("goonies", 10)
movie2 = Movie.new("ghostbusters", 9)
movie3 = Movie.new("goldfinger")

playlist1 = Playlist.new("Kermit")

# Command line arguments are stored in global array, ARGV (argument vector). The .shift method returns the argument passed to the command line. If shift returns nil, "movies.csv" is loaded as the default
playlist1.load(ARGV.shift || "movies.csv")

loop do

  puts "\nHow many viewings? ('quit' to exit)"
  # Gets number from console input
  answer = gets.chomp.downcase

  case answer
    # Regex to match against any number
    when /^\d+$/
      puts "Enjoy your #{answer} viewings..."
      playlist1.play(answer.to_i)
    when 'quit', 'exit'
      playlist1.print_stats
      break
    else
      puts "Please enter a number or 'quit'"
  end

end

playlist1.save