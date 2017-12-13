# counting_up.rb
# Counting Up exercise
# Small Problems exercises from LaunchSchool

def sequence(num)
  sequence_arr = []
  1.upto(num) { |n| sequence_arr << n }
  sequence_arr
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Better way

def sequence2(num)
  (1..num).to_a
end
