# reverse_it_p1.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

puts 'One way:'
def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

# test cases
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

puts 'Another way:'
def reverse_sentence2(sentence)
  sentence_arr = sentence.split
  reversed_sentence = []

  sentence_arr.each { |word| reversed_sentence.unshift(word) }
  reversed_sentence.join(' ')
end

# test cases
puts reverse_sentence2('') == ''
puts reverse_sentence2('Hello World') == 'World Hello'
puts reverse_sentence2('Reverse these words') == 'words these Reverse'