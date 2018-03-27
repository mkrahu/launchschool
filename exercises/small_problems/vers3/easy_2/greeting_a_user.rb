# greeting_a_user.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

print 'What is your name? '
name = $stdin.gets.chomp

if name[-1] == '!'
  puts "HELLO #{name.chop.upcase}. WHY ARE YOU SCREAMING?!"
else
  puts "Hello #{name}."
end