# calculator.rb
# Calculator program from Lesson 2: Small Programs
# Small Problems exercises from LaunchSchool

require 'yaml'
LANG = 'en'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_message(message, lang="en")
  MESSAGES[lang][message]
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

def operator_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

prompt(get_message('welcome', LANG))
prompt(get_message('valid_name', LANG))
name = ''
loop do
  name = $stdin.gets.chomp
  break unless name.empty?
  prompt(get_message('name_error', LANG))
end
prompt("Hi, #{name}!")

loop do
  prompt(get_message('valid_number', LANG))
  number1 = ''
  loop do
    number1 = $stdin.gets.chomp
    break if valid_number?(number1)
    prompt(get_message('number_error', LANG))
  end

  prompt(get_message('valid_number', LANG))
  number2 = ''
  loop do
    number2 = $stdin.gets.chomp
    break if valid_number?(number2)
    prompt(get_message('number_error', LANG))
  end


  prompt(get_message('valid_operator', LANG))
  operation = ''
  loop do
    operation = $stdin.gets.chomp
    break if %w(1 2 3 4).include?(operation)
    prompt(get_message('operator_error', LANG))
  end

  prompt("#{operator_message(operation)} #{number1} and #{number2}...")
  result = case operation
           when '1' then number1.to_f + number2.to_f
           when '2' then number1.to_f - number2.to_f
           when '3' then number1.to_f * number2.to_f
           when '4' then number1.to_f / number2.to_f
           end

  prompt("#{get_message('result', LANG)} #{result}")

  prompt(get_message('rerun_message', LANG))
  answer = $stdin.gets.chomp.downcase
  break unless answer.start_with?('y')
end
