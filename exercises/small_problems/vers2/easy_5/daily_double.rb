# daily_double.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def crunch(str)
  return '' if str.empty?
  crunched_str = str[0]
  index = 1
  while index < str.length
    crunched_str << str[index] if str[index] != str[index - 1]
    index += 1
  end
  crunched_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''