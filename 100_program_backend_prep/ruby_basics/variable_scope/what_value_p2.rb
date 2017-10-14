# what_value_p2.rb 
# What's my value (part 2) exercise
# Ruby Basics exercises from LaunchSchool

a = 7

def my_value(a)
  a += 10
end

my_value(a)
# puts 7, the 'a' variable is passed into the method as a argument and
# then assigned to the parameter 'a' (local in scope to the my_value 
# method), therefore the original variable 'a' is not affected (the names
# being the same is merely a coincidence) because the += does not mutate
# the caller
puts a