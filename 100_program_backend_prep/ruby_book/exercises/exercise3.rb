# exercise3.rb 
# Final exercises from the book Intro to Programming LaunchSchool

test_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odd = test_array.select do |n|
  n.odd?
end

p odd