# print_while.rb
# Print While exercise
# Ruby Basics exercises from LaunchSchool

puts "One way:"

count = 0

while count < 5
  puts rand(100)
  count += 1
end

puts "Another way:"
numbers = []
while numbers.size < 5
  numbers << rand(100)
end
puts numbers

puts "A difference way"

5.times { puts rand(100) }


