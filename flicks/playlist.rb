require_relative 'movie'
require_relative 'die'

class Playlist

  attr_reader :name

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play
    puts "#{@name}'s playlist:"
    puts @movies

    @movies.each do |movie|
      die = Die.new
      case die.roll_die
      when 1..2
        movie.thumbs_down
        puts "#{movie.title} got a thumbs down."
      when 3..4
        puts "#{movie.title} was skipped."
      else
        movie.thumbs_up
        puts "#{movie.title} got a thumbs up."
      end
      puts movie
    end

  end

end 