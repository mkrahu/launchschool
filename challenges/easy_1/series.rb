# series.rb

class Series
  attr_reader :numbers

  def initialize(num)
  @numbers = num.each_char
  end

  def slices(slice_by)
    raise ArgumentError, 'Invalid size, must be less than numbers length' if slice_by > numbers.size

    numbers.map(&:to_i).each_cons(slice_by).to_a
  end
end