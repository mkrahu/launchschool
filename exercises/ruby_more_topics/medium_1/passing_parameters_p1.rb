# passing_parameters_p1.rb

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Let's start gathering food."
end

gather(items) { |produce| puts "Let's gather #{produce.join(', ')}" }