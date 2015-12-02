module Rankable

  # It is better practice for a module to depend on a method or attribute in the hosting class, as opposed to an instance variable being present (In this case, we should use self instead of instance variable, @rank)
  # When using self.rank for thumbs_up/thumbs_down, we are using the attr_reader, rank. However, thumbs_up/thumbs_down will change the variable, so we need to remember to change it to an attr_accessor in the Movie class.
  def thumbs_up
    self.rank += 1
  end

  def thumbs_down
    self.rank -= 1
  end

  def hit?
    self.rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
  end

  def <=>(other)
    other.rank <=> self.rank
  end

end 