# fizzbuzz.rb
# fizzbuzz exercise
# Small Problems exercises from LaunchSchool

def fizzbuzz(num1, num2)
  (num1..num2).each do |num|
      if num % 3 == 0 && num % 5 == 0
        print "FizzBuzz#{num == num2 ? '' : ', '}"
      elsif num % 3 == 0
        print "Fizz#{num == num2 ? '' : ', '}"
      elsif num % 5 == 0
        print "Buzz#{num == num2 ? '' : ', '}"
      else
        print "#{num}#{num == num2 ? '' : ', '}"
      end
  end
end

fizzbuzz(1, 15)

# Better way

def fizzbuzz2(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end 