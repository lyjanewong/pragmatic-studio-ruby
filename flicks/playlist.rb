require_relative 'movie'
require_relative 'die'
require_relative 'waldorf_and_statler'
require_relative 'snack_bar'

class Playlist

  attr_reader :name

  def initialize(name)
    @name = name
    @movies = []
  end

  def load(from_file)
    File.readlines(from_file).each do |line|
      add_movie(Movie.from_csv(line))
    end
  end

  def save(to_file="movie_rankings.csv")
    File.open(to_file, "w") do |file|
      @movies.sort.each do |movie|
      file.puts movie.to_csv
    end
end

  end

  def add_movie(movie)
    @movies << movie
  end

  def play(viewings)
    puts "#{@name}'s playlist:"
    
    puts @movies.sort

    snacks = SnackBar::SNACKS
    puts "\nThere are #{snacks.size} snacks available in the snack bar:"

    snacks.each do |snack|
      puts "-#{snack.name} has #{snack.carbs} carbs"
    end

    1.upto(viewings) do |count|
      puts "\nViewing #{count}:"
      @movies.each do |movie|
        WaldorfAndStatler.review(movie)
        snack = SnackBar.random
        movie.ate_snack(snack)
        puts movie
      end
    end
  end

  def total_carbs_consumed

    # Reduce the movies array to the sum of all carbs consumed across movies
    @movies.reduce(0) do |sum, movie|
      sum + movie.carbs_consumed
    end

  end

  def print_stats
    puts "\n#{@name}'s Stats:"

    puts "#{total_carbs_consumed} total carbs consumed"

    @movies.sort.each do |movie|

      puts "\n#{movie.title}'s snack totals:"

      # Instead of directly using the @snack_carbs hash, we use a custom iterator here.
      # WHY? Making the movie's @snack_carbs hash a readable attribute exposes the Movie class unnecessarily and makes it so the Playlist class relies on the fact that snacks are stored in a hash. This makes it dependent on the Movie class (coupling) and makes maintaining the program more difficult. 
      movie.each_snack do |snack|
        puts "#{snack.carbs} total #{snack.name} carbs"
      end

      puts "#{movie.carbs_consumed} grand total carbs"

    end

    hits, flops = @movies.partition { |movie| movie.hit? }

    puts "\nHits:"
    puts hits.sort

    puts "\nFlops:"
    puts flops.sort 
  end

end 

