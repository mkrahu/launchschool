# all_substrings.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def substrings_at_start(str)
  substrings = []
  str.chars.each_with_index { |_, index| substrings << str[0..index] }
  substrings
end

def substrings(str)
  results = []
  (0...str.length).each do |index|
    substring = str[index..-1]
    results += substrings_at_start(substring)
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]