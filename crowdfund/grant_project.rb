require_relative 'project'

class GrantProject < Project

  def remove_funds
    @funds = @funds
    puts "- #{@name} is a grant project. Funds cannot be removed."
  end

end

if __FILE__ == $0
  grant = GrantProject.new("Grant", 500, 140)

  puts grant.funds
  grant.add_funds
  puts grant.funds
  grant.remove_funds
  puts grant.funds

end