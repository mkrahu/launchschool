# what_value_p9.rb 
# What's my value (part 9) exercise
# Ruby Basics exercises from LaunchSchool

a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

# puts 7, the first 'a' variable is available to the block scope, but
# when the |a| is passed into the block, that creates a separate 'a'
# local to the block, and therefore assignments in the block reference
# the local 'a' variable, and leave the 'a' variable outside the block
# unaffected
puts a