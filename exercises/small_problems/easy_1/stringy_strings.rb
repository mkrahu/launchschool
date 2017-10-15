# stringy_strings.rb
# Stringy Strings exercise
# Small Problems exercises from LaunchSchool

def stringy(number)
  stringy = []
  number.times do |index|
    n = index.even? ? 1 : 0
    stringy << n
  end
  stringy.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'