# odd_numbers.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

puts 'One way'
1.upto(99) do |num|
  puts num if num.odd?
end

puts 'Another way:'
puts (1..99).select(&:odd?)