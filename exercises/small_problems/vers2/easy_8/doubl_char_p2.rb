# double_char_p2.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def double_consonants(str)
  repeater_chars = str.chars.map do |char| 
    if char =~ /[a-z]/i && char =~ /[^aeiou]/i
      char * 2
    else
      char
    end
  end
  repeater_chars.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""