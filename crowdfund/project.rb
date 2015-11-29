class Project

  attr_reader :target
  attr_accessor :name, :funds

  def initialize (name, target, current_funds=0)
    @name = name
    @target = target
    @funds = current_funds
    @pledges = Hash.new(0)
  end

  def pledges_received

    @pledges.each do |name, amount|
      pledge = Pledge.new(name, amount)
      yield pledge
    end

  end

  def add_funds
    @funds += 25
    puts "+ #{@name} project got more funds!"
  end

  def remove_funds
    @funds -= 15
    puts "- #{@name} project lost some funds!"
  end

  def total_pledge_amount
    @pledges.values.reduce(0, :+)
  end

  def pledge_amount(pledge)
    @pledges[pledge.name] += pledge.amount

    puts "#{pledge.dollar_signs} #{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@pledges}"
  end

  def total_funds
    @funds + total_pledge_amount
  end

  def funds_to_target
    @target - total_funds
  end

  def fully_funded?
    total_funds >= @target
  end

  def status
    fully_funded? ? "Target Reached" : "Funding in Progress"
  end

  def to_s
    if fully_funded?
      "#{@name} project has $#{total_funds} in funding towards a goal of $#{@target}.\n(#{status} - Total Funds = $#{total_funds})\n\n"
    else
      "#{@name} project has $#{total_funds} in funding towards a goal of $#{@target}.\n(#{status} - Funds to Goal = $#{funds_to_target})\n\n"
    end
  end

end