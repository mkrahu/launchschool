ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'

require_relative '../quotes'

class QuotesTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def session
    last_request.env["rack.session"]
  end

  def create_quotes
    quotes = []
    quotes << Quote.new('test quote...', 'test author')
    { 'rack.session' => { quotes: quotes } }
  end

  def test_index_no_quotes
    get '/quotes'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'No quotes yet...'
    assert_includes last_response.body, '<a href="/quote/new">Create New Quote</a>'
  end

  def test_index_with_quotes
    get '/quotes', {}, create_quotes

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'test quote... - test author'
    refute_includes last_response.body, 'No quotes yet...'
    assert_includes last_response.body, '<a href="/quote/new">Create New Quote</a>'
  end

  def test_new_quote_form
    get '/quote/new'

    assert_equal 200, last_response.status
    assert_includes last_response.body, '<form action="/quote/new" method="post">'
    assert_includes last_response.body, 'textarea name="quote"'
    assert_includes last_response.body, 'input name="author"'
    assert_includes last_response.body, '<button type="submit">'
  end

  def test_create_quote
    post '/quote/new', { quote: 'test quote..', author: 'test author' }

    assert 302, last_response.status
    assert_equal 'You added a quote!', session[:message]
    assert_includes last_response["Location"], '/quotes'
  end
end

