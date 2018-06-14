def test1
  yield(1)
end

def test2(&block)
  p block
  block.call(5)
end

def test3(block)
  # p block
  # p block.lambda?
  # block.call(1)
  yield(1)
end

def test4
  yield
end

num = 5
proc1 = Proc.new { |test| puts num; puts test }

# puts "Test 1 tests:"
# puts "test1(proc1)"
# # test1(proc1) 
# puts "ArgumentError, did not expect arguments"
# puts "test1(&proc1): "
# test1(&proc1) # turns proc1 to a block and yields to it 
#               # (argument '1' is disregarded since proc1 does not accept an argument)
#               # puts num is evaluated (the body of proc1) and the local variable num (equal to 5)
#               # is found
# puts "test1 { |arg| puts arg }"
# test1 { |arg| puts arg } #
# puts "test1 { |arg| proc1.call }"
# test1 { |arg| proc1.call }
# puts

# puts "Test 2 tests"
# puts "test2(proc1)"
# # test2(proc1)
# puts "ArgumentError, did not expect arguments"
# puts "test2(&proc1)"
# test2(&proc1)
# puts "test2 { |num| puts num }"
# test2 { |num| puts num }
# puts "test2 { |num| proc1.call }"
# test2 { |num| proc1.call }
# puts

# puts "Test 3 tests"
# puts "test3(proc1)"
# # test3(proc1)
# puts "ArgumentError, did not expect arguments"
# puts "test3(&proc1)"
# test3(&proc1)
# puts "test3 { |num| puts num }"
# test3 { |num| puts num }
# puts "test3 { |num| proc1.call }"
# test3 { |num| proc1.call }