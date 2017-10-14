# exercise3.rb 
# Exercises from Chapter 'Loops and Iterators' LaunchSchool

array = ['one', 'two', 'three', 'four', 'five']

array.each_with_index { |x, i| puts "#{i}: #{x}"}