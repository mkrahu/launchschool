def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

#find_first_nonzero_among(0, 0, 1, 0, 2, 0) # ArgumentError, we have given more argument then provided in the method definition
find_first_nonzero_among(1) # NoMethodError, undefined 'each' method for integer 1. Need to pass in an array not and integer