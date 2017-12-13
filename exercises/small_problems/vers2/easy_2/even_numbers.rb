# even_numbers.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

puts 'One way:'
puts (1..99).select(&:even?)

puts 'Another way:'
1.upto(99) { |num| puts num if num.even? }
