# grocery_list.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def buy_fruit(fruit_arr)
  exploded_fruit_arr = fruit_arr.map do |subarr|
    [subarr[0]] * subarr[1]
  end
  exploded_fruit_arr.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]