# double_char_p1.rb
# Double Char (Part 1) exercise
# Small Problems exercises from LaunchSchool

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''