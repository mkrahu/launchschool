# equality_assertions.rb

require 'minitest/autorun'

class EqualityTest < MiniTest::Test

  def test_equality
    assert_equal('xyz', value.downcase)
  end
end