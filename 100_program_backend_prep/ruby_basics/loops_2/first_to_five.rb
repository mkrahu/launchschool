# first_to_five.rb
# First to Five exercise
# Ruby Basics exercises from LaunchSchool

number_a = 0
number_b = 0

loop do 
  number_a += rand(2)
  number_b += rand(2)
  next if number_a != 5 && number_b != 5

  puts "#{number_a == 5 ? 'number_a' : 'number_b'} is the winner!"
  break
end