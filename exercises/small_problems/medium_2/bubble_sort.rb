# bubble_sort.rb
# Bubble Sort exercise
# Small Problems exercises from LaunchSchool

def bubble_sort!(arr)
  sorted = true
  while sorted
    sorted = false
    for i in 0..(arr.length - 2)
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = true
        p arr
      end 
    end
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)