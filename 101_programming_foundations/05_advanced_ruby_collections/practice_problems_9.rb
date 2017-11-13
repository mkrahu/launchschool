# practice_problems_9.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arr = arr.map do |sub_arr|
              sub_arr.sort do |a, b|
                b <=> a
              end
            end

p sorted_arr