# stoplight_p2.rb
# Stoplight (Part 2) exercise
# Ruby Basics exercises from LaunchSchool

stoplight = ['Green', 'Yellow', 'Red'].sample

if stoplight == 'Green'
  puts "Go!"
elsif stoplight == 'Yellow'
  puts "Slow down!"
elsif stoplight == 'Red'
  puts "Stop!"
end