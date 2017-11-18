# cute_angles.rb
# Cute angles exercise
# Small Problems exercises from LaunchSchool

DEGREES_TO_MINUTES = 60
MINUTES_TO_SECONDS = 60
DEGREES_TO_SECONDS = DEGREES_TO_MINUTES * MINUTES_TO_SECONDS

def dms(num)
  total_seconds = (num * DEGREES_TO_SECONDS).round
  degrees, minutes_secs = total_seconds.divmod(DEGREES_TO_SECONDS)
  minutes, seconds = minutes_secs.divmod(MINUTES_TO_SECONDS)
  "#{degrees}°#{format("%02d", minutes)}'#{format("%02d", seconds)}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
