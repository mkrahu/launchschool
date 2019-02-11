require 'sinatra'
require 'sinatra/reloader'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

get '/users/:name' do
  erb :index
end
