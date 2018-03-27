# tip_calculator.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

print 'What is the bill? '
bill = $stdin.gets.chomp.to_f

print 'What is the tip percentage? '
tip_percent = $stdin.gets.chomp.to_i

tip = bill * tip_percent / 100.0
total = bill + tip

puts "The tip is $#{sprintf('%.2f', tip)}"
puts "The total is $#{sprintf('%.2f', total)}"