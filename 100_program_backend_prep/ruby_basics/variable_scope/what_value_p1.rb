# what_value_p1.rb 
# What's my value (part 1) exercise
# Ruby Basics exercises from LaunchSchool

a = 7 

def my_value(b)
  b += 10
end

my_value(a)
# will put 7, no change to outside variable, 'a' is passed to the method
# and then assigned to a new variable as a part of the method, no
# mutation of a is performed
puts a