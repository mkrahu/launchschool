require 'sinatra'
require "sinatra/reloader"
require "tilt/erubis"
require 'yaml'

before do
  @users = Psych.load_file('data/users.yaml')
end

helpers do
  def count_interests
    @users.map { |user,_| @users[user][:interests] }.flatten.size
  end

end

get '/' do
  redirect '/users'
  puts 'hello'
end

get '/users' do
  @user_names = @users.keys
  @title = 'Users'

  erb :users
end

get '/users/:name' do
  name = params[:name].to_sym

  @title = name.capitalize
  @interests = @users[name]
  @other_users = @users.keys.reject { |user_name| user_name == name }

  erb :user
end