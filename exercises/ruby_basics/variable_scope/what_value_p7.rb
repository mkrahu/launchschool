# what_value_p7.rb 
# What's my value (part 7) exercise
# Ruby Basics exercises from LaunchSchool


a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

# puts 3, the local variable 'a' is available to the block and therefore
# when the assignment of the variable 'a' occurs in the last call of each
# a is assigned to 3
puts a