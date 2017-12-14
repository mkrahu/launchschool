# palindromic_numbers.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def palindromic_number?(num)
  num_str = num.to_s
  num_str == num_str.reverse
end

# test cases
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true