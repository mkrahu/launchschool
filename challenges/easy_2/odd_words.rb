def odd_words(text)
  parsed_input_text = text.split('.')[0].split
  reverse_odds = parsed_input_text.map.with_index do |word, index|
    if index.odd?
      word[0...20].reverse
    else
      word[0...20]
    end
  end
  puts reverse_odds.join(' ') + '.'
end

odd_words("whats the matter with kansas.")