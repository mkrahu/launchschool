# rotation_p3.rb
# Rotation (Part 3) exercise
# Small Problems exercises from LaunchSchool

def rotate_str(str)
  str[1..-1] << str[0]
end

def rotate_rightmost_digits(digits, num)
  digits_str = digits.to_s
  rotated_digits = digits_str[0...-num] + rotate_str(digits_str[-num..-1])
  rotated_digits.to_i
end

def max_rotation(digits)
  digits_str = digits.to_s
  length = digits_str.length
  length.downto(2) { |n| digits_str = rotate_rightmost_digits(digits_str, n) }
  digits_str
end

p max_rotation(735291) # == 321579
p max_rotation(3) # == 3
p max_rotation(35) # == 53
p max_rotation(105) # == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) # == 7_321_609_845