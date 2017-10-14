# day_or_night.rb
# Day or Night? exercise
# Ruby Basics exercises from LaunchSchool

daylight = [true, false].sample

def time_of_day(day_night)
  puts day_night ? "It's daytime!" : "It's nighttime!"
end

time_of_day(daylight)