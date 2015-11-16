require_relative 'project'

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
      project.add_funds
      project.remove_funds
      project.add_funds
      puts "UPDATE: #{project}"
    end

  end

end