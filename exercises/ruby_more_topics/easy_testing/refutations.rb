# refutations.rb

require 'minitest/autorun'

class RefutationsTest < MiniTest::Test
  def test_refutations
    refute_includes(list, 'xyz')
  end
end