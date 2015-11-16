require_relative 'project'
require_relative 'fundstarter'

project1 = Project.new("The Expanse LARP", 30000, 13702)
project2 = Project.new("DIY Shoes", 75, 25)
project3 = Project.new("The Banner Saga Boardgame", 500)

startup_projects = FundStarter.new("VC-Friendly Start-up Projects")
puts startup_projects.title
startup_projects.add_project(project1)
startup_projects.add_project(project2)
startup_projects.add_project(project3)
startup_projects.request_funding
