# practice_problems_11.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_of_3 =  arr.map do |subarr|
              subarr.select do |a|
                a % 3 == 0
              end
            end

p arr_of_3