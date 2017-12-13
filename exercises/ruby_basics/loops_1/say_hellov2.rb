# say_hellov2.rb 
# Say Hello exercise
# Ruby Basics exercises from LaunchSchool
# Second round to practice for assessment

say_hello = true
iterations = 1

while say_hello
  puts 'Hello!'
  iterations += 1
  say_hello = false if iterations > 5
end