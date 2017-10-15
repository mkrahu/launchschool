# how_many.rb
# How Many? exercise
# Small Problems exercises from LaunchSchool

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 
            'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(v_array)
  vehicle_count = Hash.new(0)

  v_array.each do |v|
    vehicle_count[v] += 1
  end

  vehicle_count.each do |vehicle, count|
    puts "#{vehicle} => #{count}"
  end
end

count_occurrences(vehicles)

puts vehicles.count('car')
p vehicles

