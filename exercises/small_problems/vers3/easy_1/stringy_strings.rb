# stringy_strings.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def stringy(num)
  str = ''
  num.times { |n| n.even? ? str << '1' : str << '0' }
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'