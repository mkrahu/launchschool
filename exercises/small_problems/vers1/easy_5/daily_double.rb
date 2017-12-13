# daily_double.rb
# ddaaiillyy ddoouubbllee exercise
# Small Problems exercises from LaunchSchool


def crunch(str)
  if str.length < 1
    crunched_str = ''
  else
    crunched_str = str[0]
  end
  
  counter = 1
  while counter < str.length
    crunched_str += str[counter] if str[counter] != str[counter-1]
    counter += 1
  end
  crunched_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''