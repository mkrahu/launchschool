# boolean_assertions.rb

require 'minitest/autorun'

class BooleanTest < MiniTest::Test

  def test_boolean
    assert_equal(true, value.odd?)
  end
end