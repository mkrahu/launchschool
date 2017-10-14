# exercise7.rb 
# Exercises from Arrays chapter of Intro to Programming LaunchSchool

puts "One way"
arr1 = [1, 2, 3, 4, 5]
arr2 = arr1.map { |a| a + 2 }

p arr1
p arr2

puts "Another way"
arr = [1, 2, 3, 4, 5]
new_arr = []

arr.each do |n|
  new_arr << n + 2
end

p arr
p new_arr