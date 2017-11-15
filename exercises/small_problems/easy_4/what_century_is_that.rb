# what_century_is_that.rb
# What Century is That? exercise
# Small Problems exercises from LaunchSchool

def ordinal(n)
  ending = case n.to_i % 100
           when 11, 12, 13 then 'th'
           else
             case n.to_i % 10
             when 1 then 'st'
             when 2 then 'nd'
             when 3 then 'rd'
             else 'th'
             end
           end
  n.to_s + ending
end

def century(year)
  if year.to_s.length > 2
    century = (year - 1) / 100 + 1
  else
    century = 1
  end
  ordinal(century)
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
