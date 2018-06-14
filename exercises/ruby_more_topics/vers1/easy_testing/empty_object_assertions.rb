# empty_object_assertions.rb

require 'minitest/autorun'

class EmptyObjectTest < MiniTest::Test
  def test_empty_object
    assert_empty list
  end
end