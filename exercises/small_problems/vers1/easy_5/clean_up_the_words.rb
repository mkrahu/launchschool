# cleanup_the_words.rb
# Clean up the Words exercise
# Small Problems exercises from LaunchSchool

def cleanup(str)
  str.gsub!(/[^a-zA-z]/, ' ').gsub!(/[ ]+/,' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

puts "Further exploration:"

def cleanup2(str)
  new_str = str.chars.map do |char|
                if [*'0'..'9', *'a'..'z', *'A'..'Z'].include?(char)
                  char
                else
                  ' '
                end
             end
  p new_str
  new_str.join.squeeze(' ')
end

puts cleanup2("---what's my +*& line?") == ' what s my line '