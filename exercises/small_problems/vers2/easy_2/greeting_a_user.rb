# greeting_a_user.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

print "What is your name? "
name = $stdin.gets.chomp

if name[-1] == '!'
  puts "HI #{name[0..-2].upcase}. WHY ARE YOU SCREAMING?!"
else
  puts "Hi #{name}."
end