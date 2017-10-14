# divisible_by_three.rb
# Divisble by Three exercise
# Ruby Basics exercises from LaunchSchool

numbers = [5, 9, 21, 26, 39]

divisible_by_three = numbers.select { |number| number % 3 == 0 }

p divisible_by_three