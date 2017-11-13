# practice_problems_10.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
        incr_hsh = {}
        hsh.each do |key, value|
          incr_hsh[key] = value + 1
        end
        incr_hsh
      end

p arr