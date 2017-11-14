# palindromic_strings_p1.rb
# Palindromic String (Part 1) exercise
# Small Problems exercises from LaunchSchool

def palindrome?(arg)
  arg == arg.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true
puts palindrome?([1,2,2,1]) == true