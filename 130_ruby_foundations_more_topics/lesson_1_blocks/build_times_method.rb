# build_times_method.rb

def times(num)
   index = 0
   while index < num
    yield(index)
    index += 1
   end
   num
end

times(5) do |num|
  puts num
end
