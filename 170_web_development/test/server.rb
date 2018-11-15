require 'socket'

def parse_request(request_line)
  # parse method
  http_method, paths_and_params = request_line.split

  # parse path and params
  path, text_params = paths_and_params.split('?')
  
  # parse params and create param hash
  params = {}
  text_params.split('&').each do |pair|
    params[pair.split('=').first] = pair.split('=')[1]
  end

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)
loop do
  client =  server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  next unless request_line

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  # calculate roll based on 'rolls' and 'sides' params
  client.puts "<h1>Rolls!</h1>"
  rolls = params['rolls'].to_i
  sides = params['sides'].to_i
  rolls.times { client.puts "<p>#{rand(sides) + 1}</p>" }

  client.puts "</body"
  client.puts "</html>"
  client.close
end