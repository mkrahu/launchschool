class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    original = strand.each_char
    other = other_strand.each_char

    loop do
      distance += 1 if original.next != other.next
    end
    distance
  end
end