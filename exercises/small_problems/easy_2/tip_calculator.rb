# tip_calculator.rb
# Tip Calculator exercise
# Small Problems exercises from LaunchSchool

print "What was the bill? "
bill = $stdin.gets.chomp.to_f

print "What is the tip percentage? "
percent = $stdin.gets.chomp.to_f / 100

tip = (bill * percent).round(2)

puts "The tip is $#{sprintf('%.02f',tip)}"
puts "The total is $#{sprintf('%.02f',(bill + tip))}"