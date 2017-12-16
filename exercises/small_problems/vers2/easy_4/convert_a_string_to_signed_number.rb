# convert_a_string_to_signed_number.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

STRING_NUM_TO_NUM_HASH = ('0'..'9').zip(0..9).to_h

def string_to_integer(num_str)
  converted_nums = num_str.chars.map { |char| STRING_NUM_TO_NUM_HASH[char] }
  
  total_num = 0
  converted_nums.reverse.each_with_index do |num, index|
    total_num += num * (10 ** index)
  end
  total_num
end

def string_to_signed_integer(num_str)
  case num_str[0]
  when '+'
    string_to_integer(num_str[1..-1])
  when '-'
    -1 * string_to_integer(num_str[1..-1])
  else
    string_to_integer(num_str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100