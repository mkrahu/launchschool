require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry'
require 'yaml'
require 'bcrypt'

class Quote
  attr_accessor :quote, :author
  attr_reader :id

  def initialize(quote, author)
    self.quote = quote
    self.author = author
  end

  def to_s
    "#{quote} - #{author}"
  end
end

def validate_quotation(quote, author)
  errors = []
  if quote.strip.empty? || author.strip.empty?
    errors << 'Quote and author must be not be empty.'
  elsif quote.length > 150
    errors << 'Quote must not be more than 150 characters.'
  elsif author.length > 20
    errors << 'Author name must not be more than 20 characters.'
  end
  errors
end

def users_path
 if ENV['RACK_ENV'] == 'test'
   File.expand_path('./test/users.yaml', __dir__)
 else
   File.expand_path('./users.yaml', __dir__)
 end
end

def load_users
  YAML.load_file(users_path) || {}
end

def validate_signup(username, password, password_confirm)
  users = load_users
  errors = []

  if users.keys.include?(username)
    errors << 'Username is already taken.'
  elsif password.strip.empty?
    errors << 'Username must not be empty'
  elsif password != password_confirm
    errors << 'Passwords do not match'
  end
  errors
end

def create_user(username, password)
  users = load_users
  password_hash = BCrypt::Password.create(password).to_s

  users[username] = { 'password' => password_hash }

  updated_users = YAML.dump(users)
  File.write(users_path, updated_users)
end

def validate_user(username, password)
  users = load_users
  errors = []

  if users[username] &&
    hashed_password = users[username]['password']
    if BCrypt::Password.new(hashed_password) == password
      errors
    else
      errors << 'Invalid username and password'
    end
  end
end

configure do
  enable :sessions
  set :session_secret, 'secret'

  set :erb, :escape_html => true
end

before do
   session[:quotes] ||= []
end

helpers do
  def signed_in?
    !!session[:username]
  end
end

get '/' do
  redirect '/quotes'
end

get '/quotes' do
  erb :index
end

get '/quote/new' do
  erb :quote_new
end

post '/quote/new' do
  quote = params[:quote]
  author = params[:author]

  errors = validate_quotation(quote, author)
  if errors.empty?
    session[:quotes] << Quote.new(quote, author)

    session[:message] = 'You added a quote!'
    redirect '/quotes'
  else
    session[:error] = errors

    erb :quote_new
  end
end

get '/user/new' do
  erb :user_new
end

post '/user/new' do
  username = params[:username]
  password = params[:password]
  password_confirm = params[:confirm]

  errors = validate_signup(username, password, password_confirm)
  if errors.empty?
    create_user(username, password)
    session[:username] = username

    session[:message] = 'Welcome!'
    redirect '/quotes'
  else
    session[:error] = errors
    erb :user_new
  end
end

get '/user/signin' do
  erb :user_signin
end

post '/user/signin' do
  username = params[:username]
  password = params[:password]

  errors = validate_user(username, password)
  if errors.empty?
    session[:username] = username
    redirect '/quotes'
  else
    session[:error] = errors
    erb :user_signin
  end
end

post '/user/signout' do
  session.delete(:username)

  redirect '/quotes'
end
