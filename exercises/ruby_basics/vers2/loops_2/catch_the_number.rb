loop do
  number = rand(100)
  puts number
  break if (1..10).cover?(number)
end