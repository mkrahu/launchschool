# practice_problems_1.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr = ['10', '11', '9', '7', '8']

p arr.sort { |a,b| b.to_i <=> a.to_i }
