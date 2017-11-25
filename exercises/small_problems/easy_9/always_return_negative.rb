# always_return_negative.rb
# Always Return Negative exercise
# Small Problems exercises from LaunchSchool

def negative(num)
  num < 0 ? num : -1 * num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
