class Integer

  def to_roman
    thousands, remainder = self.divmod(1000)
    hundreds, remainder = remainder.divmod(100)
    tens, remainder = remainder.divmod(10)
    ones = remainder

    'M' * thousands +
    convert_single_roman(hundreds, :hundreds) + 
    convert_single_roman(tens, :tens) +
    convert_single_roman(ones, :ones)
  end

  private 

  def convert_single_roman(num, place)
    numerals = { :hundreds => ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'], 
                 :tens => ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'],
                 :ones => ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'] }
    numerals[place][num]
  end
end

