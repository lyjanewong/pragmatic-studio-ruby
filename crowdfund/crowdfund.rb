require_relative 'project'
require_relative 'fundstarter'

project1 = Project.new("The Expanse LARP", 30000, 13702)
project2 = Project.new("DIY Shoes", 75, 70)
project3 = Project.new("The Banner Saga Boardgame", 500)

startup_projects = FundStarter.new("VC-Friendly Start-up Projects")
puts startup_projects.title
startup_projects.load_projects("crowdfund_projects.csv")

loop do 

  puts "How many rounds of funding? (Enter 'exit' to end)"
  rounds = gets.chomp.downcase

  case rounds
  when /^\d+$/
    startup_projects.request_funding(rounds.to_i)
  when 'exit'
    startup_projects.print_status
    break
  else
    puts "Please enter number of rounds or 'exit' to end."
  end

end

startup_projects.save_under_funded_projects

