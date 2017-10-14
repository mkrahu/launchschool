# only_even.rb
# Only Even exercise
# Ruby Basics exercises from LaunchSchool

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end