class Project

  def initialize (name, target, current_funds=0)
    @name = name
    @target = target
    @funds = current_funds
  end

  attr_reader :funds, :target
  attr_accessor :name

  def funds_to_target
    @target - @funds
  end

  def add_funds
    @funds += 25
    puts "#{@name} project got more funds!"
  end

  def remove_funds
    @funds -= 15
    puts "#{@name} project lost some funds!"
  end

  def to_s
    "#{@name} project has $#{@funds} in funding towards a goal of $#{@target}. (Funds to Goal = $#{funds_to_target})"
  end
  
end