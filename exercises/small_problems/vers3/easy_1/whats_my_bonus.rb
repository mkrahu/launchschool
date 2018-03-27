# whats_my_bonus.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def calculate_bonus(salary, bonus_bol)
  bonus_bol ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000