# when_will_i_retire.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

print 'What is your age? '
age = $stdin.gets.chomp.to_i

print 'At what age would you like to retire? '
retire_age = $stdin.gets.chomp.to_i

year = Time.now.year
working_years = retire_age - age
retire_year = year + working_years

puts "It's #{year}. You will retire in #{retire_year}."
puts "You only have #{working_years} year of work to go!"