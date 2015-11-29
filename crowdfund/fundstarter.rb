require_relative 'project'
require_relative 'die'
require_relative 'funding_round'
require_relative 'pledge_pool'

class FundStarter

  attr_reader :title

  def initialize(title)
    @title = title
    @projects = []
  end

  def load_projects(from_file)

    File.readlines(from_file).each do |line|
      name, target, funds = line.split(',')
      project = Project.new(name, target.to_i, funds.to_i)
      add_project(project)
    end

  end

  def save_under_funded_projects(to_file="under_funded_projects.csv")

    File.open(to_file, "w") do |file|
      file.puts "Projects that still require funding:"
      sorted_under_funded_projects.each do |project|
        file.puts "#{project.name}".ljust(40, ".") + "Outstanding Funds = $#{project.funds_to_target}"
      end
    end

  end

  def add_project(project)
    @projects << project
  end

  def fully_funded_projects
    @projects.select {|project| project.fully_funded?}
  end

  def under_funded_projects
    @projects.reject {|project| project.fully_funded?}
  end

  def sorted_under_funded_projects
    under_funded_projects.sort_by { |project| project.funds_to_target }
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

  def print_status

    puts "\n---"

    @projects.each do |project|

      puts "\n#{project.name} Pledges:"

      project.pledges_received do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end

      puts "\t= $#{project.total_pledge_amount} in total pledges\n\n"

    end

    puts "---"

    puts "\nLatest Update (As of: #{Time.now.strftime "%d/%m/%Y, %I:%M %p"}) :\n"

    puts "\n♥ #{fully_funded_projects.size} project(s) reached their target:"
    fully_funded_projects.each do |project|
      puts "- #{project.name}"
    end

    puts "\n♥ #{under_funded_projects.size} project(s) still in progress:"
    under_funded_projects.each do |project|
      puts "- #{project.name}"
    end

    puts "\nFeeling supportive? Why not fund these projects: \n"

    sorted_under_funded_projects.each do |project|
      puts "#{project.name}".ljust(40, ".") + "Outstanding Funds = $#{project.funds_to_target}"
    end

  end

end