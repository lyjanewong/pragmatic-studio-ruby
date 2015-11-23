require_relative 'project'
require_relative 'die'

module FundingRound

  def self.get_funded(project)
    die = Die.new
    case die.roll
    when 1 || 3 || 5
      project.remove_funds
    else
      project.add_funds
    end
  end

end