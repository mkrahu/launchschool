# included_object_assertions.rb

require 'minitest/autorun'

class IncludedObjectTest < MiniTest::Test
  def test_included_object
    assert_includes(list, 'xyz')
  end
end