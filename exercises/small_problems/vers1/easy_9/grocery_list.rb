# grocery_list.rb
# Grocery List exercise
# Small Problems exercises from LaunchSchool

def buy_fruit(fruit_arr)
  flat_fruit_arr = []
  fruit_arr.each do |fruit|
    fruit[1].times { flat_fruit_arr << fruit[0] }
  end
  flat_fruit_arr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Better way

def buy_fruit2(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end