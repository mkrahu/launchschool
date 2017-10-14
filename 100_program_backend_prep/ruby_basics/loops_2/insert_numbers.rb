# insert_numbers.rb
# Insert Numbers exercise
# Ruby Basics exercises from LaunchSchool

numbers = []

loop do 
  print 'Enter a number: '
  numbers << $stdin.gets.chomp.to_i
  break if numbers.size == 5
end

puts "Here's your array: #{numbers.inspect}"