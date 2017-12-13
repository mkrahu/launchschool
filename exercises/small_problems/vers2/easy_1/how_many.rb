# how_many.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

vehicles = ['car', 'car', 'truck', 'car', 'SUV',
            'truck', 'motorcycle', 'motorcycle',
            'car', 'truck']

puts 'One way:'
def count_occurences(arr)
  count_hash = Hash.new(0)

  arr.each do |element|
    count_hash[element] += 1
  end

  count_hash.each { |key, value| puts "#{key} => #{value}" }
end

count_occurences(vehicles)

puts 'Another way:'
def count_occurences2(arr)
  arr.uniq.each do |element|
    puts "#{element} => #{arr.count(element)}"
  end
end

count_occurences2(vehicles)
