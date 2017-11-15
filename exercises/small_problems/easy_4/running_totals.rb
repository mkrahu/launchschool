# running_totals.rb
# Running Totals exercise
# Small Problems exercises from LaunchSchool

def running_total(arr)
  sum = 0
  arr.map do |n|
    sum += n
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []


def running_total2(arr)
  sum = 0
  arr.each_with_object([]) do |n,sum_array|
    sum_array << sum += n
  end
end

puts running_total2([2, 5, 13]) == [2, 7, 20]
puts running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total2([3]) == [3]
puts running_total2([]) == []