# convert_string_to_number.rb
# Convert a String to a Number! exercise
# Small Problems exercises from LaunchSchool


STRING_INTEGER_MAP = {  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                        '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0 }


def string_to_integer(str)
  arr = str.chars.map { |char| STRING_INTEGER_MAP[char] }
  number = 0
  arr.reverse.each_with_index do |element,index|
    calc = element * 10 ** index
    number += calc
  end
  number
end

def string_to_signed_integer(str)
  if ['+','-'].include?(str[0])
    number = string_to_integer(str[1..-1])
    if str[0] == '+'
      number
    else
      -1 * number
    end
  else
    string_to_integer(str)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100