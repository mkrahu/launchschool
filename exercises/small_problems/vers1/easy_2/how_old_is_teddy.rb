# how_old_is_teddy.rb
# How Old is Teddy? exercise
# Small Problems exercises from LaunchSchool

print "Hi! What's your name? "
name = $stdin.gets.chomp
name = 'Teddy' if name.empty?

puts "#{name} is #{rand(20..200)} years old!"