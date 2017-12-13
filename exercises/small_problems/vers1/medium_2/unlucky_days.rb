# unlucky_days.rb
# Unlucky Days exercise
# Small Problems exercises from LaunchSchool

require 'date'

def friday_13th(year)
  count = 0
  for i in 1..12
    thirteenth = Date.new(year, i, 13)
    count += 1 if thirteenth.friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
