# double_doubles.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def double?(num)
  num_str = num.to_s
  midpoint = num_str.length / 2
  num_str[0...midpoint] == num_str[midpoint..-1]
end

def twice(num)
  double?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10