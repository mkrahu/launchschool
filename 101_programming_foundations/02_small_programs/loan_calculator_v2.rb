
# helper methods
def prompt(message)
  puts("=> #{message}")
end

def valid_dollar_amt?(str)
  str =~ /\A[$]?[0-9]*\.?[0-9]+\Z/
end

def valid_apr?(str)
  str =~ /\A[0-9]*\.?[0-9]+[%]?\Z/
end

def valid_integer?(str)
  Integer(str)
rescue ArgumentError
  nil
end

# begin main program logic
prompt('Welcome to the loan calculator!')

# get loan amount
loan_amount = nil
loop do
  prompt('Please provide your loan amount:')
  loan_amount = gets.chomp
  break if valid_dollar_amt?(loan_amount)
  prompt('Please provide a valid (positive) number...')
end

# get apr amount (can be Integer or Float with %)
apr = nil
loop do
  prompt('Please provide the Annual Percent Rate (example 5 or 5%, 2 or 2.5%):')
  apr = gets.chomp
  break if valid_apr?(apr)
  prompt('Please provide a valid APR')
end

# get loan length (in years)
years = nil
loop do
  prompt('Please provide the loan duration (in years)')
  years = gets.chomp
  break if valid_integer?(years) && years.to_i > 0
  prompt('Please provide a valid number of years...')
end

loan_amount = loan_amount.delete('$').to_i # covert to Integer drop $
loan_months = years.to_i * 12 # covert from months to years
monthly_interest = apr.to_i.fdiv(100).fdiv(12) # convert APR to monthly interest

monthly_payment = loan_amount *
                  (monthly_interest /
                  (1 - (1 + monthly_interest)**-loan_months))

prompt("Your monthly payment is: $#{monthly_payment.round(2)}")
