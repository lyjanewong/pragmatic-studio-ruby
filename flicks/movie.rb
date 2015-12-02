require_relative 'rankable'

class Movie
  include Rankable

  attr_accessor :title, :rank

  def initialize(title,rank=0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new(0)
  end

  # There is no object, so self. creates a Class method that can be called directly on the class itself
  def self.from_csv(line)
    title, rank = line.split(',')
    movie = Movie.new(title, Integer(rank))
  end

  def to_csv
    "#{@title}, #{@rank}"
  end

  # Create the custom iterator, each_snack, that returns (yields) a snack object from the movie's associated @snack_carbs hash 
  def each_snack
    @snack_carbs.each do |name, carbs|
      # Takes the key value pair from the snack_carbs hash to construct a new snack object
      snack = Snack.new(name, carbs)
      yield snack
    end
  end

  def carbs_consumed
    @snack_carbs.values.reduce(0, :+)
  end

  def ate_snack(snack)

    @snack_carbs[snack.name] += snack.carbs
    puts "#{@title} led to #{snack.carbs} #{snack.name} carbs being consumed."
    puts "#{@title}'s snacks: #{@snack_carbs}"

  end

  def to_s
    "#{@title} has a rank of #{@rank} (#{status})"
  end 

end

#### Example Code:
# __FILE__ = Variable that holds the file name
# $0 / $PROGRAM_NAME = Currently running program
# If the file is run directly, the code below will run.

if __FILE__ == $0
  movie = Movie.new("goonies", 10)
  puts movie.title
  puts movie.rank

  movie.thumbs_up
  movie.thumbs_up
  puts movie.rank

  movie.thumbs_down
  puts movie.rank
end