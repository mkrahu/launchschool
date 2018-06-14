# kind_assertions.rb

require 'minitest/autorun'

class KindTest < MiniTest::Test
  def test_kind
    assert_kind_of(Numeric, value)
  end
end