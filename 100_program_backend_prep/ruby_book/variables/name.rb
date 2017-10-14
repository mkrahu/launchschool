# name.rb
#
# Chapter 'Variables' Exercise 1 & 4 for the 
# Intro to Programming Ruby in LaunchSchool

print "Hi there! What's your first name? "
first_name = gets.chomp
print "What's your last name? "
last_name = gets.chomp

puts "Hi #{first_name} #{last_name}! That's a really nice name!"


# Chapter 'Variables' Exercise 3 portion:

10.times { puts "#{first_name} #{last_name}!"}