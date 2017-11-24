# palindromic_substrings.rb
# Palindromic Substrings exercise
# Small Problems exercises from LaunchSchool

def substrings_at_start(str)
  substr_arr = []
  1.upto(str.length) do |n|
    substr_arr << str.slice(0,n)
  end
  substr_arr
end

def substrings(str)
  substrings = []
  0.upto(str.length - 1) do |n|
    substrings << substrings_at_start(str[n..-1])
  end
  substrings.flatten
end

def palindromes(str)
  substrings(str).select { |str| str.length > 1 && str == str.reverse }
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

# Further exploration

def palindromes2(str)
  substrings(str).select do |str|
    str.delete('^0-9a-z').length > 1 && 
    str.downcase.delete('^0-9a-z') == str.downcase.delete('^0-9a-z').reverse
  end
end

p palindromes2('hello-madam-did-madam-goodbye')
