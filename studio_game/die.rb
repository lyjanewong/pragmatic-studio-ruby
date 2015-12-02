require_relative 'auditable'

class Die
  include Auditable

  attr_reader :number

  # Ensures that there is a valid number assigned to @number even if
  # the die has not be rolled yet
  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
    audit
    # roll needs to return a number, so it needs to be returned as the last expression
    @number
  end

end

if __FILE__ == $0
  die = Die.new
  puts die.roll
  puts die.roll
  puts die.roll
end