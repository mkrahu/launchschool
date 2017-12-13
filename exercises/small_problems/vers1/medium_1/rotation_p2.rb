# rotation_p2.rb
# Rotation (Part 2) exercise
# Small Problems exercises from LaunchSchool

def rotate_str(str)
  str[1..-1] << str[0]
end

def rotate_rightmost_digits(digits, num)
  digits_str = digits.to_s
  rotated_digits = digits_str[0...-num] + rotate_str(digits_str[-num..-1])
  rotated_digits.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917