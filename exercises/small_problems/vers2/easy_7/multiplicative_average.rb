# multiplicative_average.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def show_multiplicative_average(arr)
  mult_average = arr.inject(:*) / arr.length.to_f 
  puts "The result is #{format('%.3f', mult_average)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])