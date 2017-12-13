# after_midnight_p2.rb
# After Midnight (Part 2) exercise
# Small Problems exercises from LaunchSchool

MINUTES_IN_DAY = 1440

def parse_time(time_str)
  hours, minutes = time_str.split(':')
  total_minutes = (hours.to_i * 60) + minutes.to_i
end

def before_midnight(time_str)
  (MINUTES_IN_DAY - parse_time(time_str)) % MINUTES_IN_DAY
end

def after_midnight(time_str)
  parse_time(time_str) % MINUTES_IN_DAY
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0