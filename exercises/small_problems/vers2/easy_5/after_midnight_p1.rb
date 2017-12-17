# after_midnight_p1.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def time_of_day(num)
  calc = num < 0 ? 'before' : 'after'
  num = num.abs % 1440
  case calc
  when 'before'
    hours, minutes = (1440 - num).divmod(60)
    "#{format('%02d', hours)}:#{format('%02d', minutes)}"
  when 'after'
    hours, minutes = num.divmod(60)
    "#{format('%02d',hours)}:#{format('%02d', minutes)}"
  else
    "00:00"
  end
end

# test cases
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"