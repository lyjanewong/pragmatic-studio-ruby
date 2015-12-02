module Playable

  # It is not necessary to use self to read the value of an attribute (name)
  # However, you must use self on the health attribute, otherwise it will be treated as a local variable, and the health of the Player object will not be updated
  def blam
    self.health -= 10
    puts "#{name} got blammed!"
  end

  def w00t
    self.health += 15
    puts "#{name} got w00ted!"
  end

  def strong?
    @health > 100
  end

end