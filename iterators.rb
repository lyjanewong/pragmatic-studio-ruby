def conversation

  puts "Hello"
  yield
  puts "Goodbye"

end

conversation { puts "Good to meet you!" }

#def five_times
#
#  1.upto(5) do |n|
#    yield n
#  end
#
#end

def n_times(count)

  1.upto(count) do |n|
    yield n
  end  

end

n_times(10) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
