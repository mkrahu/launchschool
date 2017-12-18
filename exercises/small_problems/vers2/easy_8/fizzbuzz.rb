# fizzbuzz.rb
# Launch School 101-109 Small Problems Exercises (2nd time through)

def fizzbuzz(num1, num2)
  num1.upto(num2) do |n|
    if n % 3 == 0 && n % 5 == 0
      puts 'FizzBuzz'
    elsif  n % 3 == 0
      puts 'Fizz'
    elsif n % 5 == 0
      puts 'Buzz'
    else 
      puts n
    end
  end
end

fizzbuzz(1, 15) 