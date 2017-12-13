# double_doubles.rb
# Double Doubles exercise
# Small Problems exercises from LaunchSchool

def twice(num)
  string_num = num.to_s
  num_length = string_num.length

  if string_num[0, (num_length / 2)] == string_num[(num_length / 2)..-1]
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334_433) == 668_866
p twice(444) == 888
p twice(107) == 214
p twice(103_103) == 103_103
p twice(3_333) == 3_333
p twice(7_676) == 7_676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
