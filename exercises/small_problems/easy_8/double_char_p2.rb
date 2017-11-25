# double_char_p2.rb
# Double Char (Part 2) exercise
# Small Problems exercises from LaunchSchool

def double_consonants(str)
  repeated_chars = str.chars.map do |char|
    if char =~ /[a-z]/i && char =~ /[^aeiou]/i
      char * 2
    else
      char
    end
  end
  repeated_chars.join
end

p double_consonants('String') == 'SSttrrinngg'
p double_consonants('Hello-World!') == 'HHellllo-WWorrlldd!'
p double_consonants('July 4th') == 'JJullyy 4tthh'
p double_consonants('') == ''
