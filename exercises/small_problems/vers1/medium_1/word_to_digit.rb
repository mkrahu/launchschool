WORD_TO_DIGIT = { 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
                  'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8
                  'nine' => 9 }

def word_to_digit(sentence)
  WORD_TO_DIGIT.keys.each do |key|
    setence.gsub!(/\b#{key}\b/, DIGIT_HASH[key]))
  end
  words
end