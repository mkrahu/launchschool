# empty_the_array.rb
# Empty the Array exercise
# Ruby Basics exercises from LaunchSchool

names = ['Sally', 'Joe', 'Lisa', 'Henry']
puts "First to last..."
loop do 
  puts names.shift
  break if names.empty? 
end

names = ['Sally', 'Joe', 'Lisa', 'Henry']
puts "Last to first..."
loop do 
  puts names.pop
  break if names.empty? 
end