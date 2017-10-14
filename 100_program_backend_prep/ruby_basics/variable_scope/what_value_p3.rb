# what_value_p3.rb 
# What's my value (part 3) exercise
# Ruby Basics exercises from LaunchSchool

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
# puts 7, the 'a' variable in the my_value is local in scope to the
# my_value method and will not affect the 'a' variable outside of it's
# scope
puts a