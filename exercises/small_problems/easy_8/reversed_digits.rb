# reversed_digits.rb
# Convert number to reversed array of digits exercise
# Small Problems exercises from LaunchSchool

def reversed_number(num)
  reversed_num = num.to_s.reverse
  reversed_num.to_i # convert back to integer (and drop leading zeroes)
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1