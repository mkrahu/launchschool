require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = 'The Adventures of Sherlock Holmes'
  @contents = File.readlines('data/toc.txt')

  erb :home
end

get "/chapter/:number" do
  @number = params[:number]
  @title = "Chapter #{@number}"
  @contents = File.readlines('data/toc.txt')
  @chapter = File.readlines("data/chp#{@number}.txt","\n\n")

  erb :chapter
end
