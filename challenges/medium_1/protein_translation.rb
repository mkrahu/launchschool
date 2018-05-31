class InvalidCodonError < StandardError; end

class Translation
  CODONS = { 'AUG' => 'Methionine', 'UGG' => 'Tryptophan' }
  %w(UUU UUC).each { |codon| CODONS[codon] = 'Phenylalanine' }
  %w(UUA UUG).each { |codon| CODONS[codon] = 'Leucine' }
  %w(UCU UCC UCA UCG).each { |codon| CODONS[codon] = 'Serine' }
  %w(UAU UAC).each { |codon| CODONS[codon] = 'Tyrosine' }
  %w(UGU UGC).each { |codon| CODONS[codon] = 'Cysteine' }
  %w(UAA UAG UGA).each { |codon| CODONS[codon] = 'STOP' }

  def self.of_codon(codon)
    protein = CODONS[codon]
    raise InvalidCodonError , 'Not a valid codon' if protein == nil
    protein
  end

  def self.of_rna(rna)
    proteins = []
    rna.chars.each_slice(3) do |codon|
      protein = self.of_codon(codon.join)
      break if protein == 'STOP'
      proteins << protein
    end
    proteins
  end
end