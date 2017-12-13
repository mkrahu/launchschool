# odd.rb
# Odd exercise
# Small Problems exercises from LaunchSchool

def is_odd?(integer)
  integer % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

def is_odd_2?(integer)
  integer.remainder(2).abs == 1
end

puts is_odd_2?(2)    # => false
puts is_odd_2?(5)    # => true
puts is_odd_2?(-17)  # => true
puts is_odd_2?(-8)   # => false
puts is_odd_2?(0)    # => false
puts is_odd_2?(7)    # => true