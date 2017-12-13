# when_will_i_retire.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

print "What is your age? "
age = $stdin.gets.chomp.to_i

print "At what age would you like to retire? "
retire_age = $stdin.gets.chomp.to_i

current_year = Time.now.year
retire_year = current_year + (retire_age - age)

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You only have #{retire_year - current_year} years of work to go!"