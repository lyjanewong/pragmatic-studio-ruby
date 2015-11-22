class Project

  def initialize (name, target, current_funds=0)
    @name = name
    @target = target
    @funds = current_funds
  end

  attr_reader :target
  attr_accessor :name, :funds

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

  def fully_funded?
    @funds >= @target
  end

  def status
    fully_funded? ? "Target Reached" : "Funding in Progress"
  end

  def to_s
    if fully_funded?
      "#{@name} project has $#{@funds} in funding towards a goal of $#{@target}.\n (#{status} - Total Funds = $#{@funds})\n\n"
    else
    "#{@name} project has $#{@funds} in funding towards a goal of $#{@target}.\n (#{status} - Funds to Goal = $#{funds_to_target})\n\n"
    end
  end

end