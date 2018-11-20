say_hello = true
index = 0

while say_hello
  puts 'Hello!'
  index += 1
  say_hello = false if index == 5
end