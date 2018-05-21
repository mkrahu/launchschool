# exception_assertions.rb

require 'minitest/autorun'

class ExceptionTest < MiniTest::Test
  def test_exception_assertion
    assert_raises(NoExperienceError) { employee.hire }
  end
end