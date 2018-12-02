require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry'

root = File.expand_path("..", __FILE__)

get '/' do
  @files = Dir[root + "/data/*"].map do |file_name|
    short_name = File.basename(file_name)

    { short_name: short_name,
      location: "../data/#{short_name}" }
  end

  erb :index
end
