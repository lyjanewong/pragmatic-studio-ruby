require_relative 'project'
require_relative 'die'
require_relative 'funding_round'
require_relative 'pledge_pool'

class FundStarter

  def initialize(title)
    @title = title
    @projects = []
  end

  attr_reader :title

  def add_project(project)
    @projects << project
  end

  def print_name_and_outstanding_funds(project)
    puts "#{project.name}".ljust(40, ".") + "Outstanding Funds = $#{project.funds_to_target}"
  end

  def print_status

    fully_funded_project, under_funded_project = @projects.partition {|project| project.fully_funded?}

    puts "\nLatest Update (As of: #{Time.now.strftime "%d/%m/%Y, %I:%M %p"}) :\n"

    puts "\n♥ #{fully_funded_project.size} project(s) reached their target:"
    fully_funded_project.each do |project|
      puts "- #{project.name}"
    end

    puts "\n♥ #{under_funded_project.size} project(s) still in progress:"
    under_funded_project.each do |project|
      puts "- #{project.name}"
    end

    puts "\nFeeling supportive? Why not fund these projects: \n"

      under_funded_project.sort_by { |project| project.funds_to_target }

      under_funded_project.each do |project|
        print_name_and_outstanding_funds(project)
      end

  end


  def request_funding(rounds)

    puts "There are currently #{@projects.count} active projects in #{@title}:"

    @projects.each do |project|
      puts "#{@projects.index(project) + 1}. #{project.name}"
    end

    puts "---"

    @projects.each do |project|
      puts project
    end

    puts "---"

    pledges = PledgePool::PLEDGES

    puts "There are #{pledges.size} possible pledge amounts:"

    pledges.each do |pledge|
      puts "\tA #{pledge.name} pledge is worth $#{pledge.amount}."
    end

    puts "---"

    1.upto(rounds) do |round|
      puts "Funding Round #{round}:"
      @projects.each do |project|
        FundingRound.get_funded(project)
        puts "UPDATE: #{project}"
      end
    end
  end

end