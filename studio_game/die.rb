class Die

  attr_reader :number

  # Ensures that there is a valid number assigned to @number even if
  # the die has not be rolled yet
  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
  end

end