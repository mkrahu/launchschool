# what_value_p6.rb 
# What's my value (part 6) exercise
# Ruby Basics exercises from LaunchSchool

a = 7

def my_value(b)
  b = a + a
end

my_value(a)
# Error, undefined variable. The variable 'a' is not initiated in the
# scope of the my_value method, the 'a' variable outside of the method
# my_value is not available in the my_value methods scope
puts a