# next_featured_number.rb
# Next Featured Number Higher than Given Value exercise
# Small Problems exercises from LaunchSchool

def featured(n)
  (n+1).upto(9_999_999_999) do |i|
    i_as_array = i.to_s.chars
    if  i.odd? &&
        i % 7 == 0 &&
        i_as_array == i_as_array.uniq
      return i
    else
      next
    end
  end
  puts "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
featured(9_999_999_999)