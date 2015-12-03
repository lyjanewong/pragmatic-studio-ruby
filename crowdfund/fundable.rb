module Fundable

  def add_funds
    self.funds += 25
    puts "+ #{@name} project got more funds!"
  end

  def remove_funds
    self.funds -= 15
    puts "- #{@name} project lost some funds!"
  end

  def funds_to_target
    @target - total_funds
  end

  def fully_funded?
    total_funds >= @target
  end
  
end