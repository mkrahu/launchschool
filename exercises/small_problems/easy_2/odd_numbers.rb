# odd_numbers.rb
# Odd Numbers exercise
# Small Problems exercises from LaunchSchool

puts "One way:"
(1..99).each do |number|
  puts number if number.odd?
end

puts "Another way:"
1.upto(99).each do |number|
  puts number if number.odd?
end