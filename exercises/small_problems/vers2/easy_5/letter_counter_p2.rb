# letter_counter_p2.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def word_sizes(sentence)
  word_size_hash = Hash.new(0)
  words_size_arr = sentence.split.map { |word| word.delete('^a-zA-Z').length }
  words_size_arr.each { |word_length| word_size_hash[word_length] += 1 }
  word_size_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}