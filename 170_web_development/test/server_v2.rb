require 'socket'

def parse_request(request)

  http_method, path_and_params, _http = request.split
  path, params = path_and_params.split('?')

  params = params.split('&').map { |param| param.split('=') }.to_h

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  dice = []
  rolls.times { dice << rand(sides) + 1 }

  client.puts 'HTTP/1.1 200 OK'
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"
  client.puts dice
  client.puts "</body>"
  client.puts "</html>"
  client.close
end
