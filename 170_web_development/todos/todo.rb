require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret' # don't do this in a regular app
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# View all of the lists
get "/lists" do
  @lists = session[:lists]

  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list

end

# Create a new list
post "/lists" do
  name = params[:list_name].strip

  if (1..100).cover?(name.size)
    session[:lists] << { name: name, todos: [] }
    session[:success] = "The list has been created."

    redirect "/lists"
  else
    session[:error] = 'List name must be between 1 and 100 characters.'

    erb :new_list
  end
end
