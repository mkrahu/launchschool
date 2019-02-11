require 'socket'

server = TCPServer.new 'localhost', 3000

loop do
  client = server.accept
  request = client.readlines("\r\n")
  puts request

  puts request
  client.puts "HTTP/1.1 200 OK"
  client.close
end
