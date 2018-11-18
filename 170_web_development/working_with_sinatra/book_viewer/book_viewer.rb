require "sinatra"
require "sinatra/reloader"

helpers do
  def in_paragraphs(text)
    paragraphs = text.split("\n\n")
    paragraphs.map { |paragraph| "<p>#{paragraph}</p>" }.join
  end
end

before do
  @contents = File.readlines('data/toc.txt')
end

get "/" do
  @title = 'The Adventures of Sherlock Holmes'

  erb :home
end

get "/chapter/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

def each_chapter
  @contents.each_with_index do |name, index|
    chapter_num = index + 1
    text = File.read("data/chp#{chapter_num}.txt")
    yield chapter_num, name, text
  end
end

def chapters_matching(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |num, name, text|
    results << { number: num, name: name } if text.include?(query)
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

not_found do
  redirect "/"
end
