print "Give me a number from 0 to 100: "
number = $stdin.gets.chomp.to_i

case number 
when 0..50
  puts "That number is between 0 and 50"
when 51..100
  puts "That number is between 51 and 100"
else
  if number < 0
    puts "No negative numbers!"
  else
  puts "That number is greater than 100"
  end
end