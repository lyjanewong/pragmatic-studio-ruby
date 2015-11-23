require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

class FundStarter

  def initialize(title)
    @title = title
    @projects = []
  end

  attr_reader :title

  def add_project(project)
    @projects << project
  end

  def request_funding 

    puts "There are currently #{@projects.count} active projects in #{@title}:"

    @projects.each do |project|
      puts "#{@projects.index(project) + 1}. #{project.name}"
    end

    puts "---"

    @projects.each do |project|
      puts project
    end

    puts "---"

    @projects.each do |project|
      FundingRound.get_funded(project)
      puts "UPDATE: #{project}"
    end

  end

end