require_relative 'project'
require_relative 'die'

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
      die = Die.new
      case die.roll
      when 1 || 3 || 5
        project.remove_funds
      else
        project.add_funds
      end
      puts "UPDATE: #{project}"
    end

  end

end