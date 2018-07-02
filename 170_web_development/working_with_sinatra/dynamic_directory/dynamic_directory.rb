require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  @title = 'Dynamic Directory'
  @files = Dir.glob('public/*').map { |filename| File.basename(filename) }.sort
  @files.reverse! if params['sort'] == 'desc'
  erb :files
end