# myapp.rb
require 'sinatra'

get '/' do
  'Hello world!'
end

get '/:name' do |n|
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  # n stores params['name']
  "Hello #{n}!"
end