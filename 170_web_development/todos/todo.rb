require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'sinatra/content_for'
require 'pry'

configure do
  enable :sessions
  set :session_secret, 'secret' # don't do this in a regular app
end

before do
  session[:lists] ||= []
end

get '/' do
  redirect '/lists'
end

# View all of the lists
get '/lists' do
  @lists = session[:lists]

  erb :lists, layout: :layout
end

# Render the new list form
get '/lists/new' do
  erb :new_list
end

# Return error message if name is invalid. Return nil if name is valid.
def error_in_list_name(name)
  if !(1..100).cover?(name.size)
    'List name must be between 1 and 100 characters.'
  elsif session[:lists].any? { |list| list[:name] == name }
    'List name must be unique'
  end
end

# Create a new list
post '/lists' do
  list_name = params[:list_name].strip

  error = error_in_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = 'The list has been created.'

    redirect '/lists'
  end
end

# Display an individual list
get '/lists/:index' do
  index = params[:index].to_i
  @list = session[:lists][index]

  erb :list, layout: :layout
end

# Edit am existing list
get '/lists/:index/edit' do
  index = params[:index].to_i
  @list = session[:lists][index]

  erb :edit_list, layout: :layout
end

# Edit a existing list
post '/lists/:index' do
  index = params[:index].to_i
  @list = session[:lists][index]

  list_name = params[:list_name].strip

  error = error_in_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    session[:lists][index][:name] = list_name
    session[:success] = 'The list has been updated.'

    redirect "lists/#{index}"
  end
end

post '/lists/:index/destroy' do
  index = params[:index].to_i

  session[:lists].delete_at(index)

  session[:success] = 'The list has been deleted.'
  redirect '/lists'
end
