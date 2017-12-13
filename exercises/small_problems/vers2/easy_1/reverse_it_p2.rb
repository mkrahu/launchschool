# reverse_it_p2.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

puts 'One way:'
def reverse_words(sentence)
  sentence.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

# test cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

puts 'Another way:'
def reverse_words2(sentence)
  sentence_arr = sentence.split

  reversed_sentence_arr = sentence_arr.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  reversed_sentence_arr.join(' ')
end

# test cases
puts reverse_words2('Professional')          # => lanoisseforP
puts reverse_words2('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words2('Launch School')         # => hcnuaL loohcS