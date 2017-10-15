# reverse_it_p1.rb
# Reverse It (Part 1) exercise
# Small Problems exercises from LaunchSchool

def reverse_sentence(sentence)
  reverse = []
  sentence.split.each do |word|
    reverse.unshift(word)
  end
  reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'


