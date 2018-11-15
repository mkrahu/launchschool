require 'yaml'

# load config file with messages
MESSAGES = YAML.load_file('calculator_messages.yml')

# helper methods
def prompt(message)
  puts "=> #{message}"
end

def get_message(message, lang="en")
  MESSAGES[lang][message]
end

def validate_numeric?(str)
  Integer(str)
rescue ArgumentError
  nil
end

def operation_to_message(operation)
  case operation
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

def request_operation
  loop do
    prompt(get_message('valid_operator'))
    operation = gets.chomp
    return operation if ['1', '2', '3', '4'].include?(operation)
    prompt('Not a valid operation...')
  end
end

def request_number
  loop do
    prompt(get_message('valid_number'))
    number = gets.chomp
    return number if number?(number)
    prompt(get_message('number_error'))
  end
end

# begin program logic
prompt(get_message('welcome'))
loop do
  number1 = request_number.to_i

  number2 = request_number.to_i

  operation = request_operation

  prompt("#{operation_to_message(operation)} #{number1} and #{number2}")

  result = case operation
           when '1' then number1 + number2
           when '2' then number1 - number2
           when '3' then number1 * number2
           when '4' then number1.fdiv(number2).round(2)
           end

  prompt("The result is #{result}")
  prompt(get_message('rerun_message'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
