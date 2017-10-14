# inline_exception_example.rb 
# Exercises from Other Stuff chapter Intro to Programming LaunchSchool

zero = 0
puts "Before each call"
zero.each { |a| puts a } rescue puts "Can't do that!"
puts "After each call"