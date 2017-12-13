# capitalize_words.rb
# Capitalize Words exercise
# Small Problems exercises from LaunchSchool

def word_cap(str)
  str.split.map(&:downcase).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further exploration
def word_cap2(str)
  str.split.map(&:downcase).each { |word| word[0] = word[0].upcase }.join(' ')
end
string = 'four score and seven'
p word_cap2(string)
p string
