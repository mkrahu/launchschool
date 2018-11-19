require 'yaml'
require 'sinatra'
require 'sinatra/reloader'

before do
  @users = YAML.load_file('data/users.yaml')
end

get "/" do
  erb :users
end

get "/user/:name" do
  @name = params[:name]
  @interests = @users[@name.to_sym]


  erb :user
end
