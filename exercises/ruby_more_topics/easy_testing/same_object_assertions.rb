# same_object_assertions

require 'minitest/autorun'

class SameObjectTest < MiniTest::Test
  def test_same_object
    assert_same(list, list.process)
  end
end