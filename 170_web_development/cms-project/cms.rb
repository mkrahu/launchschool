require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry'

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret'
end

get '/' do
  @files = Dir[root + "/data/*"].map do |file_name|
    short_name = File.basename(file_name)

    { short_name: short_name,
      location: "#{short_name}" }
  end
  erb :index
end

get '/:file_name' do
  file_path = root + '/data/' + params[:file_name]

  headers['Content-Type'] = 'text/plain'

  if File.exist?(file_path)
    File.read(file_path)
  else
    session[:error] = "#{ params[:file_name] } does not exist."
    redirect '/'
  end
end
