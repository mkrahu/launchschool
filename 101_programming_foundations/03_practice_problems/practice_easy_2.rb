# practice_easy_2.rb
# Practice Problems: Easy 2 program
# Practice Problems exercises from LaunchSchool

# Question 1
# Does ages include "Spot"?
ages = {  "Herman" => 32, 
          "Lily" => 30, 
          "Grandpa" => 402, 
          "Eddie" => 10 }

puts "One way:"
puts ages.include?("Spot")
puts "Another:"
puts ages.key?("Spot")

# Question 2
# Make transforms of munsters_description
munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# Question 3
# Add two family members to Munsters hash
ages = {  "Herman" => 32, 
          "Lily" => 30,
          "Grandpa" => 5843,
          "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

puts ages.merge!(additional_ages)

# Question 4
# See if "Dino" is in the string

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match("Dino")


# Question 5
# Better way to write the array
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Question 6 
# Add Dino to array
flintstones << "Dino"
p flintstones

# Question 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy')
p flintstones

# Question 8
# Remove everything starting with "house"
advice = "Few things in life are as important as house training your pet dinosaur."

p slice_advice = advice.slice!(0...(advice.index("house")))
p advice

# Question 9
# Count the number of t's

statement = "The Flintstones Rock!"
puts statement.count('t')

# Question 10
# Center the title string within a 40 character wide table
title = "Flintstone Family Members"
puts title.center(40)