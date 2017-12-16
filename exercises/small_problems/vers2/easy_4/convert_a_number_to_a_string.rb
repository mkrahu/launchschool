# convert_a_number_to_a_string.rb
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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'