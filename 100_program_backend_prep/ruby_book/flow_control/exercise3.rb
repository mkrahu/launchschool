print "Give me a number from 0 to 100: "
number = $stdin.gets.chomp.to_i

if number < 0
  puts "No negative numbers!"
elsif 0 <= number && number < 51
  puts "That number is between 0 and 50"
elsif 51 <= number && number < 101
  puts "That number is between 51 and 100"
else
  puts "That number is greater than 100"
end