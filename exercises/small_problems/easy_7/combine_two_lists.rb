# combine_two_lists.rb
# Combine Two Lists exercise
# Small Problems exercises from LaunchSchool

def interleave(arr1, arr2)
  newarr = []
  i = 0
  while i < arr1.length
    newarr << arr1[i] << arr2[i]
    i += 1
  end
  newarr
end

p interleave([1, 2, 3], ['a', 'b', 'c'])

# Further exploration

def interleave2(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave2([1, 2, 3], ['a', 'b', 'c'])
