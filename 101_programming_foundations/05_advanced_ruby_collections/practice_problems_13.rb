# practice_problems_13.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

p
sorted_arr = arr.sort_by do |subarr|
                subarr.select do |element|
                  element.odd?
                end
              end

p sorted_arr