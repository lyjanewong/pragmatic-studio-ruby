require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

  def initialize(title)
    @title = title
    @players = []
  end

  attr_reader :title

  def add_player(player)
    @players << player
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health} hp)"
  end

  def total_points
    @players.reduce(0) {|sum, player| sum + player.points}
  end

  def print_stats

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end

      puts "\t= #{player.points} grand total points\n"
    end

    puts "\n#{total_points} total points from treasures found"

    strong_men = @players.select {|player| player.strong?}
    wimps = @players.reject {|player| player.strong?}

    puts "\n#{title} Statistics:\n"

    puts "\n#{strong_men.length} strong players:\n"
    strong_men.each do |player| 
      print_name_and_health(player)
    end

    puts "\n#{wimps.length} wimpy players:\n"
    wimps.each do |player| 
      print_name_and_health(player)
    end

    puts "\n#{title} High Scores:"
    @players.sort.each do |player|
      puts "#{player.name}".ljust(20, ".") + "#{player.score}"
    end

  end

  def play(rounds)

  puts "There are #{@players.count} players in #{@title}:"

  @players.each do |player|
    puts player
  end

  treasures = TreasureTrove::TREASURES

  puts "\nThere are #{treasures.size} treasures to be found:"

  treasures.each do |treasure|
    puts "A #{treasure.name} is worth #{treasure.points} points"
  end

  1.upto(rounds) do |count|

    # Checks if a block was provided. If yes, yield to it.
    if block_given?
      # If the block returns true (if the total number of points is more than or equal to 2000), break out of the loop. If the block returns false, carry on with the code below.
      break if yield
    end

    puts "\nRound #{count}:"
    @players.each do |player|
    GameTurn.take_turn(player)
    puts player
    end
      
  end

  end

end