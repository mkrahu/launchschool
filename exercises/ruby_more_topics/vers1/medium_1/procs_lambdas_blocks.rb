# procs_lambdas_blocks.rb

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." } # instantiate proc (no need for Proc.new)
# puts my_proc # to_s just returns the inspect method for Proc
# puts my_proc.class # Proc
# my_proc.call # can call the proc, does not throw ArgumentError even though our block requires an arg
# my_proc.call('cat') # can pass in argument in the call method

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" } # instantiate lambda
my_second_lambda = -> (thing) { puts "This is a #{thing}" } # unique instantiation syntax
puts my_lambda # to_s just returns the inspect method for Proc
puts my_second_lambda # to_s just returns the inspect method for Proc
puts my_lambda.class # Lambda is an instance of Proc class (not different class)
my_lambda.call('dog') # can pas in argument in the call method
my_lambda.call # raises and ArgumentError, lambdas do require correct arguments to be passed
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" } # cannot use this syntax, no such class as Lambda

# Group 3
def block_method_1(animal) # method definition with yield to block (argument not passed to the block)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # argument not passed to block and no ArgumentError, must be Proc
block_method_1('seal') # no block passed to method, will raise LocalJumpError when yield is called

# Group 4
def block_method_2(animal) # method definition with yield (this time argument is passed)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # argument passed and will print correctly
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # Only one argument passed, seal will be nil (but no ArgumentError)
end
block_method_2('turtle') { puts "This is a #{animal}."}  # NameError, animal local variable not avaiable to block,
                                    # argument local variable names defined in | | of block (Proc)