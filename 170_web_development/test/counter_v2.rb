require 'socket'

def parse_request(request)

  http_method, path_and_params, _http = request.split
  path, params = path_and_params.split('?')

  params = (params || "").split('&').map { |param| param.split('=') }.to_h

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  number = params['number'].to_i

  client.puts 'HTTP/1.1 200 OK'
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"
  client.puts "<p>The number is #{number}."
  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"

  client.puts "</body>"
  client.puts "</html>"
  client.close
end
