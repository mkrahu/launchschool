# double_char_p1.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''