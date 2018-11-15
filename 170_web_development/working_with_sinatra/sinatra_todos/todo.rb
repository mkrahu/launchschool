require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'sinatra/content_for'

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

# show form for new list
get '/lists/new' do
  erb :new_list, layout: :layout
end

# method for checking list name input for errors
def list_name_error(name)
  if session[:lists].any? { |list| list[:name] == name }
    'List name must be unique'
  elsif !(1..100).cover? name.size
    'List name must be 1-100 characters'
  end
end

# add new list
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

# show a list
get '/lists/:number' do
  number = params[:number].to_i
  @list = session[:lists][number]

  erb :list, layout: :layout
end

# edit a list
get '/lists/:number/edit' do
  @number = params[:number].to_i
  @list = session[:lists][@number]

  erb :edit_list, layout: :layout
end

# update list
post '/lists/:number' do
  @number = params[:number].to_i
  @list = session[:lists][@number]
  list_name = params['list_name'].strip

  error = list_name_error(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = 'You have updated the list name.'
    redirect "/lists/#{@number}"
  end
end

# delete list
post '/lists/:number/destroy' do
  number = params[:number].to_i
  session[:lists].delete_at(number)

  session[:success] = 'You have deleted the list.'
  redirect '/lists'
end

def todo_name_error(todo)
  if !(1..100).cover? todo.size
    'Todo must be 1-100 characters'
  end
end

# Add a new todo to a list
post '/lists/:list_number/todos' do
  list_number = params[:number].to_i
  @list = session[:lists][list_number]
  todo = params[:todo].strip

  error = todo_name_error(todo)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << { name: todo, completed: false }
    session[:success] = 'The todo has been added.'
    redirect "lists/#{list_number}"
  end
end

# Delete a todo list item
post '/lists/:list_number/:todo_number/destroy' do
  list_number = params[:list_number].to_i
  @list = session[:lists][list_number]
  todo_number = params[:todo_number].to_i
  @list[:todos].delete_at(todo_number)

  session[:success] = 'You have deleted the list item.'
  redirect '/lists/:list_number'
end
