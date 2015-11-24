require_relative 'project'
require_relative 'die'
require_relative 'pledge_pool'

module FundingRound

  def self.get_funded(project)

    # Funds are randomly added or removed from each project
    die = Die.new
    case die.roll
    when 1 || 3 || 5
      project.remove_funds
    else
      project.add_funds
    end

    # Each project randomly receives a pledge
    pledge = PledgePool.random
    puts "#{project.name} received a #{pledge.name} worth $#{pledge.amount}."

  end

end