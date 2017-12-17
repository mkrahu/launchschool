# after_midnight_p2.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

MINUTES_IN_DAY = 1440
MINUTES_IN_HOUR = 60

def after_midnight(time)
  hours, secs = time.split(':').map(&:to_i)
  (MINUTES_IN_HOUR * hours + secs) % MINUTES_IN_DAY
end

def before_midnight(time)
  hours, secs = time.split(':').map(&:to_i)
  (MINUTES_IN_DAY - (MINUTES_IN_HOUR * hours + secs)) % MINUTES_IN_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0