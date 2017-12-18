# palindromic_substrings.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def substrings_at_start(str)
  substrings = []
  str.chars.each_with_index { |_, index| substrings << str[0..index] }
  substrings
end

def substrings(str)
  results = []
  (0...str.length).each do |index|
    substring = str[index..-1]
    results += substrings_at_start(substring)
  end
  results
end

def palindromes(str)
  substrings(str).select { |substr| substr == substr.reverse && substr.length > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]