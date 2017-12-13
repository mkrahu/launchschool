# now_i_know_my_abcs.rb
# Now I Know My ABCs exercise
# Small Problems exercises from LaunchSchool


def block_word?(word)
  blocks = [  ['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'],
              ['G','T'], ['R','E'], ['F','S'], ['J','W'], ['H','U'],
              ['V','I'], ['L','Y'], ['Z','M'] ]

  word.chars.each do |char|
    return false unless index = blocks.index { |block| block.include?(char.upcase) }
    blocks.delete_at(index)
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true