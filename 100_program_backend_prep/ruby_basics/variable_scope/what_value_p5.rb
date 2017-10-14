# what_value_p5.rb 
# What's my value (part 5) exercise
# Ruby Basics exercises from LaunchSchool

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
# puts 'Xyzzy'
# A reference to the 'a' variable string is passed to my_value and assigned
# to parameter 'b', however when the 'b' variable is reassigned it has
# no affect on the original variable 'a' or it's value
puts a