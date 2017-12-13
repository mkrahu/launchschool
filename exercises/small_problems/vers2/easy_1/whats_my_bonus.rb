# whats_my_bonus.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def calculate_bonus(salary, bonus_bool)
  bonus_bool ? (salary / 2) : 0
end

# test cases
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

def calculate_bonus(salary, bonus_bool)
  if bonus_bool
    salary / 2
  else
    0
  end
end