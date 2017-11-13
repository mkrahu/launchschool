# practice_problems_15.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr = [ {a: [1, 2, 3]},
        {b: [2, 4, 6], c: [3, 6], d: [4]}, 
        {e: [8], f: [6, 10]}]

all_even =  arr.select do |hsh|
              hsh.values.flatten.all? do |value|
                value.even?
              end
            end

p all_even