require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'sinatra/content_for'
require 'pry'

configure do
  enable :sessions
  set :session_secret, 'secret' # don't do this in a regular app

  set :erb, :escape_html => true
end

helpers do
  def complete?(list)
    list[:todos].size > 0 && list[:todos].all? { |todo| todo[:completed] }
  end

  def list_class(list)
    "complete" if complete?(list)
  end

  def todo_class(todo)
    "complete" if todo[:completed]
  end

  def uncompleted_todos(list)
    list[:todos].reject { |todo| todo[:completed] }.size
  end

  def total_todos(list)
    list[:todos].size
  end

  def sorted_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| complete?(list) }

    incomplete_lists.each { |list| yield list, list[:id] }
    complete_lists.each { |list| yield list, list[:id] }
  end

  def sorted_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }

    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
end

# Load list at index and handle invalid indexes
def load_list(id)
  list_ids = session[:lists].map { |list| list[:id] }

  if list_ids.include?(id)
    session[:lists].find { |list| list[:id] == id }
  else
    session[:error] = 'The specified list was not found.'
    redirect '/lists'
  end
end

# Return error message if name is invalid. Return nil if name is valid.
def error_in_list_name(name)
  if !(1..100).cover?(name.size)
    'List name must be between 1 and 100 characters.'
  elsif session[:lists].any? { |list| list[:name] == name }
    'List name must be unique'
  end
end

# Return error message if todo is invalid. Return nil if todo is valid.
def error_in_todo(name)
  if !(1..100).cover?(name.size)
    'Todo name must be between 1 and 100 characters.'
  end
end

def next_todo_id(list)
  max = list[:todos].map { |todo| todo[:id] }.max || 0
  max + 1
end

def next_list_id
  max = session[:lists].map { |list| list[:id] }.max || 0
  max + 1
end

before do
  session[:lists] ||= []
end

before "/lists/:list_id/*" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
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

# Create a new list
post '/lists' do
  list_name = params[:list_name].strip

  error = error_in_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    id = next_list_id
    session[:lists] << { id: id, name: list_name, todos: [] }
    session[:success] = 'The list has been created.'

    redirect '/lists'
  end
end

# Display an individual list
get '/lists/:list_id' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  erb :list, layout: :layout
end

# Edit am existing list
get '/lists/:list_id/edit' do

  erb :edit_list, layout: :layout
end

# Edit an existing list
post '/lists/:list_id' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  list_name = params[:list_name].strip

  error = error_in_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = 'The list has been updated.'

    redirect "lists/#{@list_id}"
  end
end

# Delete an existing list
post '/lists/:list_id/destroy' do
  session[:lists].delete_if { |list| list[:id] == @list_id }

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = 'The list has been deleted.'
    redirect '/lists'
  end

end

# Add a todo to a list
post '/lists/:list_id/todos' do
  todo = params[:todo].strip

  error = error_in_todo(todo)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    id = next_todo_id(@list)
    @list[:todos] << { id: id, name: todo, completed: false }

    session[:success] = 'The todo has been added.'
    redirect "/lists/#{@list_id}"
  end
end

# Delete a todo from a list
post '/lists/:list_id/todos/:todo_id/destroy' do
  todo_id = params[:todo_id].to_i

  @list[:todos].delete_if { |todo| todo[:id] == todo_id }

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    session[:success] = "Todo successfully deleted."
    redirect "/lists/#{@list_id}"
  end
end

# Update status of todo in a list
post '/lists/:list_id/todos/:todo_id' do
  is_completed = params[:completed] == "true"

  todo_id = params[:todo_id].to_i
  todo = @list[:todos].find { |todo| todo[:id] == todo_id }
  todo[:completed] = is_completed

  redirect "/lists/#{@list_id}"
end

# Complete all todos in a list
post '/lists/:id/complete_all' do
  @list[:todos].each do |todo|
    todo[:completed] = true
  end

  session[:success] = "All todos have been completed."

  redirect "/lists/#{@list_id}"
end

not_found do
  redirect '/lists'
end
