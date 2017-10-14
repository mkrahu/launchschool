# stoplight_p1.rb
# Stoplight (Part 1) exercise
# Ruby Basics exercises from LaunchSchool

stoplight = ['Green', 'Yellow', 'Red'].sample

case stoplight
when 'Green'
  puts "Go!"
when 'Yellow'
  puts "Slow down!"
when 'Red'
  puts "Stop!"
end