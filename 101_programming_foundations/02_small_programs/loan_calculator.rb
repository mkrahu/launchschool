# loan_calculator.rb
# Loan Calculator program from Lesson 2: Small Programs
# Small Problems exercises from LaunchSchool

def prompt(message)
  puts "> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

prompt('Welcome to the loan calculator!')

prompt('What is your loan amount?')
loan_amount = ''
loop do 
  loan_amount = $stdin.gets.chomp
  break if valid_number?(loan_amount)
  prompt('Not a valid number...')
end

prompt('What is the Annual Percentage Rate(APR) on the loan?')
prompt('Please use format 5%, 4.25%, or 5.5)')
apr = ''
loop do 
  apr = $stdin.gets.chomp.to_f / 100.0
  break if apr > 0
  apr = apr.to_f / 100.0
  prompt('Not a valid percentage')
end
monthly_interest = apr / 12.0

prompt('What is the duration of the loan (in months)?')
loan_duration_in_months = ''
loop do 
  loan_duration_in_months = $stdin.gets.chomp
  break if valid_number?(loan_duration_in_months)
  prompt('Not a valid number...')
end
p loan_amount, apr, monthly_interest, loan_duration_in_months
monthly_payment = loan_amount.to_i * (monthly_interest /
                    (1 - (1 + monthly_interest)**-loan_duration_in_months.to_i))

prompt("And your monthly payment is... $#{monthly_payment.round(2)}!")
