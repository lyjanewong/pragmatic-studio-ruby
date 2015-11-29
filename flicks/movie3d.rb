require_relative 'movie'

class Movie3D < Movie

  def initialize(title, rank, wow_factor)
    # The initialize method will be run by the parent Movie class
    # and will not be overriden by Movie3D's initialize method
    super(title, rank)
    @wow_factor = wow_factor
  end

  # Overrides thumbs_up method defined in Movie class
  # def thumbs_up
  #   @rank += (1 * @wow_factor)
  # end

  def thumbs_up
    # Calls the thumbs_up method in the Movie class
    @wow_factor.times { super }
  end

  def show_effect
    puts "Wow! " * @wow_factor
  end

end

movie3d = Movie3D.new('glee', 5, 10)

puts movie3d.rank
movie3d.thumbs_up
puts movie3d.rank

movie3d.show_effect
