def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

# We had set the initial product local variable to zero, which will always result in the number zero when multiplied by
# the other numbers in str_num. We instead set it to 1 which will produce the correct product.