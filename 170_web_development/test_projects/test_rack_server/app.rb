require 'sinatra'
require_relative './my_server'

set :server, :my_server

get '/' do
  'Hello world!'
end

get '/:random' do
  'Another site!'
end
