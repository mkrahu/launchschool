# multiplicative_average.rb
# Multiplicative Average exercise
# Small Problems exercises from LaunchSchool

def show_multiplicative_average(arr)
  multi_average = arr.inject(:*) / arr.length.to_f
  puts "The result is #{format('%.3f', multi_average)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
