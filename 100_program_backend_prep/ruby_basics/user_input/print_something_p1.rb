# print_something_p1.rb
# Print Something(Part 1) exercise
# Ruby Basics exercises from LaunchSchool

print "Do you want me to print something? (y/n) "
answer = $stdin.gets.chomp.downcase
puts "something" if answer == 'y'