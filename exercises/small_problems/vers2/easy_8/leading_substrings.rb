# leading_substrings.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def substrings_at_start(str)
  substrings = []
  str.chars.each_with_index { |_, index| substrings << str[0..index] }
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']