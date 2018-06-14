# nil_assertions.rb

require 'minitest/autorun'

class TestNil < MiniTest::Test

  def test_nil
    assert_nil(value)
  end
end