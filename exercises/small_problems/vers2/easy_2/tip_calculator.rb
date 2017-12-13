# tip_calculator.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

print "How much is the bill? "
bill = $stdin.gets.chomp.to_f

print "What percentage do you want to tip? "
tip_percent = $stdin.gets.chomp.to_f / 100

tip = bill * tip_percent
total = bill + tip

puts "The tip is $#{tip.round(2)}"
puts "The total is $#{total.round(2)}"