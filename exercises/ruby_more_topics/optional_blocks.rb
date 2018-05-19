# optional_blocks.rb

def compute()
  return yield if block_given?
  'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# More exploration
puts

def compute2(arg)
  return yield(arg) if block_given?
  'Does not compute.'
end

p compute2(2) { |arg| 5 + arg } == 7
p compute2('hello') { |arg| arg + ' world' } == 'hello world'
p compute2(true) == 'Does not compute.'