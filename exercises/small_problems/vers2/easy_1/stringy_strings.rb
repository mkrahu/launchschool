# stringy_strings.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def stringy(num)
  stringy_num = ''
  num.times { |n| stringy_num << (n.even? ? '1' : '0') }
  stringy_num
end

# test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'