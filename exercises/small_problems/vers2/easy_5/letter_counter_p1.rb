# letter_counter_p1.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def word_sizes(sentence)
  word_size_hash = Hash.new(0)
  words_size_arr = sentence.split.map { |word| word.length }
  words_size_arr.each { |word_length| word_size_hash[word_length] += 1 }
  word_size_hash
end

# test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}