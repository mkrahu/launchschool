# what_value_p8.rb 
# What's my value (part 8) exercise
# Ruby Basics exercises from LaunchSchool


array = [1, 2, 3]

array.each do |element|
  a = element
end

# Error, undefined variable. The 'a' variable is defined within the block
# and is local in scope to the block. Therefore when you exit the block
# and call 'a', the variable is no longer in existence
puts a