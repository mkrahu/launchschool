# what_century_is_that.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def ordinal(n)
  ending = case n % 100
           when 11, 12, 13 then 'th'
           else
             case n % 10
             when 1 then 'st'
             when 2 then 'nd'
             when 3 then 'rd'
             else 'th'
             end
           end

  "#{n}#{ending}"
end

def century(num)
  century_num = ((num - 1) / 100) + 1
  "#{ordinal(century_num)}"
end

# test cases
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'