words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

puts "My original way"

words_unique = words.map { |word| word.chars.sort.join }.uniq

word_anagram = {}
words_unique.each do |key|
    word_anagram[key] = []
  words.each do |word|
    word_anagram[key] << word if key == word.chars.sort.join
  end
end

word_anagram.values.each { |values| p values}

puts "Simple way from exercise"

result = {}
words.each do |word|
  key = word.chars.sort.join
  if result.has_key?(key)
    result[key] << word
  else
    result[key] = [word]
  end
end

result.values.each { |values| p values }