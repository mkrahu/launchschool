# leading_substrings.rb
# Leading Substrings exercise
# Small Problems exercises from LaunchSchool

def substrings_at_start(str)
  substr_arr = []
  1.upto(str.length) do |n|
    substr_arr << str.slice(0,n)
  end
  substr_arr
end



p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
