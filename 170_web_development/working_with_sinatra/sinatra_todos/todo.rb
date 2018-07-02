require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

get '/' do
  redirect '/lists'
end

get '/lists' do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

get '/lists/new' do
  erb :new_list, layout: :layout
end

def list_name_error(name)
  if session[:lists].any? { |list| list[:name] == name }
    'List name must be unique'
  elsif !(1..100).cover? name.size
    'List name must be 1-100 characters'
  end
end

post '/lists' do
  list_name = params['list_name'].strip

  error = list_name_error(list_name)
  if error
    session[:error] = error
    redirect '/lists/new'
  else
    session[:lists] << { name: params['list_name'], todos: [] }
    session[:success] = 'You have created a new list.'
    redirect '/lists'
  end
end
