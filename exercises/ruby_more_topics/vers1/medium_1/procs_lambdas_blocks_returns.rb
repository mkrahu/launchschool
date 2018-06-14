# procs_lambdas_blocks_returns.rb

# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call # a 'return' within a proc defined in a method will return from the method
  puts "This will never output to screen."
end

check_return_with_proc

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call # a 'return' within a lambda defined in a method will NOT return from the method, only the lambda
  puts "This will be output to screen."
end

check_return_with_lambda

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  yield
end

block_method_3 { return }