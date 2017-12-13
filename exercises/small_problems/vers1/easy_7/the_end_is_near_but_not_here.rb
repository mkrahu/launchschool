# the_end_is_near_but_not_here.rb
# The End Is Near But Not Here exercise
# Small Problems exercises from LaunchSchool

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'