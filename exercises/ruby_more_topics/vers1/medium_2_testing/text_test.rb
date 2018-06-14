require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
    @text = Text.new(@file.read)
  end

  def test_swap
    new_text = <<~HEREDOC
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    HEREDOC

    assert_equal(new_text, @text.swap('a', 'e'))
  end

  def test_word_count
    easy_text = "hello world!"
    @text2 = Text.new(easy_text)

    assert_equal(2, @text2.word_count)
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
  end
end