# convert_string_to_number.rb
# Convert a String to a Number! exercise
# Small Problems exercises from LaunchSchool

STRING_INTEGER_MAP = {  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                        '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0 }

HEX_INTEGER_MAP = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}
def string_to_integer(str)
  arr = str.chars.map { |char| STRING_INTEGER_MAP[char] }
  number = 0
  arr.reverse.each_with_index do |element,index|
    calc = element * 10 ** index
    number += calc
  end
  number
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570



def hexadecimal_to_integer(hex)
  arr = hex.chars.map { |char| HEX_INTEGER_MAP[char.downcase] }
  p arr
  number = 0
  arr.reverse.each_with_index do |element,index|
    calc = element * (16 ** index) 
    number += calc
  end
  number
end

puts hexadecimal_to_integer('4D9f') == 19871