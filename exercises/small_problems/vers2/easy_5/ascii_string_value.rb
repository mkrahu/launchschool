# ascii_string_value.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def ascii_value(str)
  str.chars.map { |char| char.ord }.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0