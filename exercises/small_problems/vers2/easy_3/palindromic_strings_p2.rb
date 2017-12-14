# palindromic_strings_p2.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def real_palindrome?(str)
  strip_str = str.gsub(/[^a-z0-9]/i,'').downcase
  p strip_str
  strip_str == strip_str.reverse
end

# test cases
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false