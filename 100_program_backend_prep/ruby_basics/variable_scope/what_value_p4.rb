# what_value_p4.rb 
# What's my value (part 4) exercise
# Ruby Basics exercises from LaunchSchool

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
# puts 'Xy-zy', a reference to the 'a' variables string "Xyzzy" is passed
# into the my_value method and assigned to the method parameter 'b', the
# call of b[2] mutates the string "Xyzzy" and therefore the value
# referenced by 'a' is changed outside of my_value as well
puts a