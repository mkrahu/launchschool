require 'pry'

factorial = Enumerator.new do |y|
  factor, prior_factor = 0, 0
  loop do
    if factor.zero?
      y << 1
      prior_factor = 1
      factor += 1
    else
      y << factor * prior_factor
      prior_factor = factor * prior_factor
      factor += 1
    end
  end
end

7.times { |_| puts factorial.next }
factorial.rewind
factorial.each_with_index do |num, index|
  puts num
  break if index == 6
end