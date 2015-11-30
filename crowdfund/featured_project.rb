require_relative 'project'

class FeaturedProject < Project

  def met_half_its_target?
    @funds >= (@target / 2)
  end

  def add_funds

    if met_half_its_target?
      @funds += (25 * 2)
      puts "#{@name} reached half its target! We're matching every donation!"
    else
      super
    end 

  end

end

if __FILE__ == $0

  featured = FeaturedProject.new("Featured", 100)

  4.times do
    featured.add_funds
    puts "#{featured.funds}"
  end

end