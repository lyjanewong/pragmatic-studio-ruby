class Die

  attr_reader :number

  def initialize
    roll_die
  end

  def roll_die
    @number = rand(1..6)
  end

end