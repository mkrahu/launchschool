items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1

gather(items) do |*produce, other|
  puts produce.join(', ')
  puts other
end

# 2

gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

# 3

gather(items) do |first, *last|
  puts first
  puts last.join(', ')
end

gather(items) do |one, two, three, four|
  puts "#{one}, #{two}, #{three}, #{four}"
end