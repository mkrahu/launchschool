# sequence_count.rb
# Sequence Count exercise
# Small Problems exercises from LaunchSchool

def sequence(count, num)
  seq_arr = []
  1.upto(count) { |n| seq_arr << num * n }
  seq_arr
end

# Another try for succinctness
def sequence2(count, num)
  (1..count).to_a.map { |c| c * num }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

puts "Another way:"

p sequence2(5, 1) == [1, 2, 3, 4, 5]
p sequence2(4, -7) == [-7, -14, -21, -28]
p sequence2(3, 0) == [0, 0, 0]
p sequence2(0, 1000000) == []