# internal_external_interators.rb

# create a new Enumerator object that iterates over an infinite list of factorials, test it
# by printing out the first 7 factorials, starting with zero

# First print them using an external iterator, then reset, then print out again using an internal iterator

factorial_enum = Enumerator.new do |yielder|
  n = 0
  accumulator = 1
  loop do
    if n.zero?
      yielder << 1
    else
      accumulator *= n
      yielder << accumulator
    end
    n += 1
  end
end

7.times { puts factorial_enum.next }

puts factorial_enum.next

factorial_enum.each do |num, index|
  puts num
  break if num > 720
end
