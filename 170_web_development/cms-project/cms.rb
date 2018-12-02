require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry'

root = File.expand_path("..", __FILE__)

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
  File.read(file_path)
end
