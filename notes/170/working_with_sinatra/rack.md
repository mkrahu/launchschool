# Rack
Rack is a web server inteferace that creates an API for creating web application (and connecting to a variety of web servers)

A web framework is "rack-based" if they adhere to the Rack interface to easily communicate HTTP requests between the server and client

Before Rack, web developers had to write separate code to connect their application with different web servers.

Rack is available in the 'rack' gem on [https://rubygems.org](https://rubygems.org)

## Requirements for a Rack application
1. Config file ending in `.ru`
2. The rack application must be a Ruby object that responds to the method `#call(env)`. This `#call(env)` take one argument, the environment variables (a Hash)

The `call` method returns a 3 item array:
1. Status code
2. Headers
3. Respond Body: This is an object that responds to `#each` and `yield` a String value.

## Simple Rack app

```ruby
# config.ru
require_relative 'hello_world'

run HelloWorld.new
```

```ruby
# hello_world.rb

class HelloWorld
  def call(env)
    ['200', {'Content-Type' => 'text/plain'}, ['Hello World!']]
  end
end
```

The configuration file `config.ru` tells the server what to run and the application itself lives in the `hello_world.rb` file. The way to spot this as a Rack application is that is responds to the `#call(env)` method.

## Run a Rack app
Use the `rackup` command
```
$ bundle exec rackup config.ru -p 9595
```
The `-p` flag specifies what port we want our application to run on.

Go to [http://localhost:9595/](http://localhost:9595/) to see the app running.

## Application Enviroment
The `env` argument in the `#call` method contains a Hash with all of the environment variables and information related to our HTTP request.

One particular variable of intereste is the `REQUEST_PATH`, this tells us the path requested in the HTTP request, and can be used for routing in the application.

## Routes in Rack

Here is the start of routing in the `hello_world.rb` application.
``` ruby
# hello_world.rb

require_relative 'advice'     # loads advice.rb

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', {"Content-Type" => 'text/plain'}, ["Hello World!"]]
    when '/advice'
      piece_of_advice = Advice.new.generate    # random piece of advice
      ['200', {"Content-Type" => 'text/plain'}, [piece_of_advice]]
    else
      [
        '404',
        {"Content-Type" => 'text/plain', "Content-Length" => '13'},
        ["404 Not Found"]
      ]
    end
  end
end
```

The application will now return different 'pages' based on the route requested.

## Adding HTML

You can add HTML directly into the `body` of our response. First, however we need to change the `Content-Type` being sent in the headers to `text/html`, this way the browser recognizes the response as HTML and will display it appropriately in the client.

```ruby
require_relative 'advice'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      [
        '200',
        {"Content-Type" => 'text/html'},
        ["<html><body><h2>Hello World!</h2></body></html>"]
      ]
    when '/advice'
      piece_of_advice = Advice.new.generate
      [
        '200',
        {"Content-Type" => 'text/html'},
        ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]
      ]
    else
      [
        '404',
        {"Content-Type" => 'text/html', "Content-Length" => '48'},
        ["<html><body><h4>404 Not Found</h4></body></html>"]
      ]
    end
  end
end
```

## View Templates
