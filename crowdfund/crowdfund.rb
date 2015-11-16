class Project

  def initialize (name, target, current_funds=0)
    @name = name
    @target = target
    @funds = current_funds
  end

  attr_reader :funds, :target
  attr_accessor :name

  def funds_to_target
    @target - @funds
  end

  def add_funds
    @funds += 25
    puts "#{@name} project got more funds!"
  end

  def remove_funds
    @funds -= 15
    puts "#{@name} project lost some funds!"
  end

  def to_s
    "#{@name} project has $#{@funds} in funding towards a goal of $#{@target}. (Funds to Goal = $#{funds_to_target})"
  end
end

class Crowdfund

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

project1 = Project.new("The Expanse LARP", 30000, 13702)
project2 = Project.new("DIY Shoes", 75, 25)
project3 = Project.new("The Banner Saga Boardgame", 500)

startup_projects = Crowdfund.new("VC-Friendly Start-up Projects")
puts startup_projects.title
startup_projects.add_project(project1)
startup_projects.add_project(project2)
startup_projects.add_project(project3)
startup_projects.request_funding
