# all_substrings.rb
# All Substrings exercise
# Small Problems exercises from LaunchSchool

def substrings_at_start(str)
  substr_arr = []
  1.upto(str.length) do |n|
    substr_arr << str.slice(0,n)
  end
  substr_arr
end

def substrings(str)
  substrings = []
  0.upto(str.length - 1) do |n|
    substrings << substrings_at_start(str[n..-1])
  end
  substrings.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]