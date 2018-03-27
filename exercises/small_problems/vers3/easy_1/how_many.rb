# how_many.rb
# Launch School 101-109 Small Problems Exercises (3rd time through)

def count_occurences(arr)
  occur_hsh = Hash.new(0)
  arr.each do |element|
    occur_hsh[element] += 1
  end

  occur_hsh.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
count_occurences(vehicles)