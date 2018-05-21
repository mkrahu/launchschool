# divisors.rb


def divisors(num)
  1.upto(num).select { |div| num % div == 0 }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
#p divisors(99400891) == [1, 9967, 9973, 99400891]

# Further exploration
puts

def divisors2(num)
  result = [1]
  return result if num == 1

  (2..Math.sqrt(num)).each do |div|
    if num % div == 0
      result << (num / div) unless (num / div) == num
      result << div
    end
  end
  (result << num).sort
end

p divisors2(1) == [1]
p divisors2(7) == [1, 7]
p divisors2(12) == [1, 2, 3, 4, 6, 12]
p divisors2(98) == [1, 2, 7, 14, 49, 98]
p divisors2(99400891) == [1, 9967, 9973, 99400891]
