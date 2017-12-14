# palindromic_strings_p1.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true