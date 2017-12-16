# convert_a_number_to_signed_string.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

NUM_TO_STR_HASH = (0..9).zip('0'..'9').to_h

def integer_to_string(num)
  num_str = ''
  loop do 
    num, remainder = num.divmod(10)
    num_str.prepend(NUM_TO_STR_HASH[remainder])
    break if num.zero?
  end
  num_str
end

def signed_integer_to_string(num)
  if num < 0
    '-' + integer_to_string(num.abs)
  elsif num > 0
    '+' + integer_to_string(num)
  else
    '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'