class Movie

  attr_reader :rank
  attr_accessor :title

  def initialize(title,rank=0)
    @title = title.capitalize
    @rank = rank
  end

  def hit?
    @rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
    # Similar to an if/else block:
    #if movie.rank >= 10
    #  "Hit"
    #else  
    #  "Flop"
    #end
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  # Compares the other movie's rank with the current movie's rank
  def <=>(other_movie)
    other_movie.rank <=> @rank
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