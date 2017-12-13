# how_long_are_you.rb
# How long are you? exercise
# Small Problems exercises from LaunchSchool

def word_lengths(str)
  str_length_arr = []
  str.split.each { |s| str_length_arr << "#{s} #{s.length}"}
  str_length_arr
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# Better way

def word_lengths2(str)
  string.split.map { |word| "#{word} #{word.length}" }
end