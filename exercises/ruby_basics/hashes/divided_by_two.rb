# divided_by_two.rb
# Divided by Two exercise
# Ruby Basics exercises from LaunchSchool

numbers = { high: 100, medium: 50, low: 10 }

half_numbers = numbers.map { |key,value| value / 2 }

p half_numbers