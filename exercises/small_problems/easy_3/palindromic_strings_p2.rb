# palindromic_strings_p2.rb
# Palindromic String (Part 2) exercise
# Small Problems exercises from LaunchSchool

def palindrome?(arg)
  arg == arg.reverse
end

def real_palindrome?(arg)
  string = arg.gsub(/[^a-zA-Z\d]/,'').downcase
  palindrome?(string)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true
puts real_palindrome?("Madam, I'm Adam") == true
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false