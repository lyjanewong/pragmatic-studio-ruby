# Mixins behave like a superclass
# They change the method look-up 

module Rankable

  def thumbs_up
    puts "#{title} got a thumbs up!"
  end

end

include Rankable

class Movi