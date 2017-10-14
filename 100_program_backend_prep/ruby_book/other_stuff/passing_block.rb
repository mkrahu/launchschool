def take_block(&block)
  block.call
end

take_block { puts "This is a block called from within a method!" }