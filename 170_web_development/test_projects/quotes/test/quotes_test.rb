ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'
require 'fileutils'

require_relative '../quotes'

class QuotesTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    setup_test_users
  end

  def teardown
    FileUtils.remove_file(users_path)
  end

  def setup_test_users
    users = { 'test' =>
                { 'password' => '$2a$10$nSz/hWkRaAMXQvIPEkrwqOTdZOOQNPj1VRWEgOKJUoFME7zpqFB7m'} }
    users = YAML.dump(users)
    File.write(users_path, users)
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

  def test_signup_form
    get '/user/new'

    assert 200, last_response.status
    assert_includes last_response.body, 'input name="username"'
    assert_includes last_response.body, 'input name="password"'
    assert_includes last_response.body, 'input name="confirm"'
    assert_includes last_response.body, '<button type="submit">'
  end

  def test_signup_user
    post '/user/new', { username: 'admin', password: 'pass', confirm: 'pass' }
    users = load_users

    assert 302, last_response.status
    assert_equal 'admin', session[:username]
    assert_includes users.keys, 'admin'
  end

  def test_signin_form
    get '/user/signin'

    assert 200, last_response.status
    assert_includes last_response.body, 'input name="username"'
    assert_includes last_response.body, 'input name="password"'
    assert_includes last_response.body, '<button type="submit">'
  end

  def test_signin_user
    post '/user/signin', { username: 'test', password: 'test' }

    assert 302, last_response.status
    assert_equal 'test', session[:username]
  end
end

