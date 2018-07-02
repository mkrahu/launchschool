require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines('data/toc.txt')
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |paragraph, index|
      "<p id=\"#{ index }\">#{ paragraph }</p>"
    end.join
  end

  def highlight_text(text, content)
    content.gsub(text,"<strong>#{text}</strong>")
  end
end

not_found do
  redirect '/'
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  title_name = @contents[number - 1]

  redirect '/' unless (1..@contents.size).cover? number

  @title = "Chapter #{number} : #{title_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

def each_chapter
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield name, number, contents
  end
end

def chapters_matching_search(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |name, number, contents|
    results << { number: number, name: name } if contents.include?(query)
  end

  results
end

def contents_matching_search(query)
  results = {}

  return results if !query || query.empty?

  each_chapter do |name, number, contents|
    contents.split("\n\n").each_with_index do |content, index|
      if content.include?(query)
        results[name] ||= []
        results[name] << { number: number, id: index, content: content }
      end
    end
  end

  results
end

get "/search" do
  @title = "Search the Table of Contents"
  @results = contents_matching_search(params[:query])

  erb :search
end
