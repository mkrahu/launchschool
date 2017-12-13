# when_will_i_retire.rb
# When Will I Retire exercise
# Small Problems exercises from LaunchSchool

print "What is your age? "
age = $stdin.gets.chomp.to_i

print "At what age would you like to retire? "
retire_age = $stdin.gets.chomp.to_i

work_years_left = retire_age - age

puts "It's #{Time.now.year}. You will retire in #{Time.now.year + work_years_left}"