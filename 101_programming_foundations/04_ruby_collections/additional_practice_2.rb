# additional_practice_2.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

ages = {  "Herman" => 32, 
          "Lily" => 30, 
          "Grandpa" => 5843, 
          "Eddie" => 10, 
          "Marilyn" => 22, 
          "Spot" => 237 }

puts "One way:"
sum_of_ages = 0
ages.values.each { |age| sum_of_ages += age }
puts sum_of_ages


puts "Another way:"
sum_of_ages = ages.values.inject(:+)
puts sum_of_ages