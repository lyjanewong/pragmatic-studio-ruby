class Movie

  attr_reader :rank
  attr_accessor :title

  def initialize(title,rank=0)
    @title = title.capitalize
    @rank = rank
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  def to_s
    "#{@title} has a rank of #{@rank}."
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