def take_block(number, &block)
  block.call(number)
end

take_block(42) { |n| puts "This is the number being passed to the block in the method: #{n}"}