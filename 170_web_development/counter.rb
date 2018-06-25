require 'socket'

def parse_request(request_line)
  # parse method
  http_method, paths_and_params = request_line.split

  # parse path and params
  path, params = paths_and_params.split('?')
  
  # parse params and create param hash

  params = (params || "").split('&').each_with_object({}) do |pair, object|
    key, value = pair.split('=')
    object[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)
loop do
  client =  server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

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

  number = params["number"].to_i
  client.puts "<h1>Counter</h1>"
  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Increment</a>"
  client.puts "<a href='?number=#{number - 1}'>Decrement</a>"
  
  

  client.puts "</body>"
  client.puts "</html>"
  client.close
end