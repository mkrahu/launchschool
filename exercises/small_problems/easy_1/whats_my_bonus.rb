# whats_my_bonus.rb
# What's my Bonus? exercise
# Small Problems exercises from LaunchSchool

puts "One way:"
def calculate_bonus(salary,qualify)
  if qualify
    salary / 2
  else
    0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

puts "Another way:"
def calculate_bonus_1(salary,qualify)
  qualify ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
