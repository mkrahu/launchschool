require 'yaml'
require 'sinatra'
require 'sinatra/reloader'

before do
  @users = YAML.load_file('data/users.yaml')
end

helpers do
  def count_interests
    count = 0

    @users.each do |name, info|
      count += info[:interests].size
    end

    count
  end
end

get "/" do
  @title = 'Users'

  erb :users
end

get "/user/:name" do
  @name = params[:name]
  @title = @name
  @interests = @users[@name.to_sym]


  erb :user
end
