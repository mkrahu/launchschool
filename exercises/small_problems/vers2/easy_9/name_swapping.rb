# name_swapping.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def swap_name(name_str)
  first_name, last_name = name_str.split
  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'