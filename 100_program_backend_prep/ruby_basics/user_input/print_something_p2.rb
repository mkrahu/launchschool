# print_something_p2.rb
# Print Something(Part 2) exercise
# Ruby Basics exercises from LaunchSchool


loop do 
  print "Do you want me to print something? (y/n) "
  answer = $stdin.gets.chomp.downcase
  if answer == 'y'
    puts "something"
    break
  elsif answer == 'n'
    break
  else
    puts "Invalid entry. Please enter y or n"
  end
end