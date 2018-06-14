def compute
 return 'Does not compute.' unless block_given?
 yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'


# Further exploration

def compute2(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute2(3) { |num| num + 3 } == 6
p compute2(3) == 'Does not compute.'
p compute2('hello') { |word| word + ' world' } == 'hello world'