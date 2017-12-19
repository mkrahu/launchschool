# sequence_count.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def sequence(count, number)
  sequence_arr = []
  1.upto(count) do |n|
    sequence_arr << number * n
  end
  sequence_arr
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []