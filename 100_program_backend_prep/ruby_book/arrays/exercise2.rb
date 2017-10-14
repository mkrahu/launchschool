# exercise2.rb 
# Exercises from the Array chapter of the Intro to Programming LaunchSchool

arr = ["b","a"]
arr = arr.product(Array(1..3))
p arr
arr.first.delete(arr.first.last)
p arr

arr = ["b","a"]
arr = arr.product([Array(1..3)])
p arr
arr.first.delete(arr.first.last)
p arr