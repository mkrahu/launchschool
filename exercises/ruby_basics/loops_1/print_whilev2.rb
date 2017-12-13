# print_whilev2.rb 
# Print While exercise
# Ruby Basics exercises from LaunchSchool
# Second round to practice for assessment

numbers = []

while numbers.length < 5
  number = (0..99).to_a.sample
  puts number
  numbers << number
end