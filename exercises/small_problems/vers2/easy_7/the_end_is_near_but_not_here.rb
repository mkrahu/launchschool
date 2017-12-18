# the_end_is_near_but_not_here.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'