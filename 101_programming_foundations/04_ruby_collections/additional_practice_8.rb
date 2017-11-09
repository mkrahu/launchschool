# additional_practice_8.rb
# Additional Practice exercises
# Practice Problems from Ruby Collections chapter from LaunchSchool

puts "Example 1:"

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

puts "Example 2:"
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end