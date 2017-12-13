# fizzbuzz.rb
# fizzbuzz exercise
# Small Problems exercises from LaunchSchool

def fizzbuzz(num1, num2)
  (num1..num2).each do |num|
    if (num % 3).zero? && (num % 5).zero?
      print "FizzBuzz#{num == num2 ? '' : ', '}"
    elsif (num % 3).zero?
      print "Fizz#{num == num2 ? '' : ', '}"
    elsif (num % 5).zero?
      print "Buzz#{num == num2 ? '' : ', '}"
    else
      print "#{num}#{num == num2 ? '' : ', '}"
    end
  end
end

fizzbuzz(1, 15)
