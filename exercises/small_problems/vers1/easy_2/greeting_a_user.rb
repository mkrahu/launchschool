# greeting_a_user.rb
# Greeting A User exercise
# Small Problems exercises from LaunchSchool

print "What's your name? "
name = $stdin.gets.chomp

if name[-1] == '!'
  puts "HELLO #{name.chop.upcase}. WHY ARE YOU SCREAMING?!"
else
  puts "Hello #{name.capitalize}."
end