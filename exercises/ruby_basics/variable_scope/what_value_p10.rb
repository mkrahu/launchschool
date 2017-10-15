# what_value_p10.rb 
# What's my value (part 10) exercise
# Ruby Basics exercises from LaunchSchool


a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
# Error. Undefined variable, the 'a' variable is not available within
# the scope of the my_value method, therefore when 'a' is called in the
# block passed to each an error is raised
puts a