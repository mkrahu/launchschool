# type_assertions.rb

require 'minitest/autorun'

class TypeTest < MiniTest::Test
  def test_type
    assert_instance_of(Numberic, value)
  end
end