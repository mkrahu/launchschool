# age.rb
#
# Chapter 'Variables' Exercise 2 for the 
# Intro to Programming Ruby in LaunchSchool

print "How old are you? "
age = gets.chomp.to_i

puts "In 10 years you will be:"
puts age + 10
puts "In 20 years you will be:"
puts age + 20
puts "In 30 years you will be:"
puts age + 30
puts "In 40 years you will be:"
puts age + 40

puts
puts "Another way:"

[10,20,30,40].each do |year| 
  puts "In #{year} years you will be:\n#{age + year}"
end

puts
puts "And another way:"
10.step(40,10) do |year|
  puts "In #{year} years you will be:\n#{age + year}"
end

