require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry'

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

configure do
  enable :sessions
  set :session_secret, 'secret'

  set :erb, :escape_html => true
end

before do
   session[:quotes] ||= []
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
