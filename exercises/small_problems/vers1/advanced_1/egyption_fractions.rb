def egyptian(rational)
  denominators = []
  counter = 1
  current = 0
  
  while current < rational
    if current + Rational(1, counter) <= rational
      denominators << counter
      current += Rational(1, counter)
    end
    counter += 1
  end
  denominators
end

def unegyptian(arr)
  arr.map { |num| Rational(1,num) }.sum
end

 p unegyptian([1, 2, 3, 6])
 p unegyptian([1, 2, 3, 4, 5])
 p unegyptian([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960])

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)