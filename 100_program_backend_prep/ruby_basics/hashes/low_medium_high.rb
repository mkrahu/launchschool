# low_medium_high.rb
# Low, Medium, High exercise
# Ruby Basics exercises from LaunchSchool

numbers = { high: 100, medium: 50, low: 10 }

low_numbers = numbers.select { |key, value| value < 25 }

p low_numbers