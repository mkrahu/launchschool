# exclusive_or.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def xor?(bool1, bool2)
  (bool1 || bool2) && !(bool1 && bool2)
end

# test cases
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false