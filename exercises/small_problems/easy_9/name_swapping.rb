# name_swapping.rb
# Name Swapping exercise
# Small Problems exercises from LaunchSchool

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'