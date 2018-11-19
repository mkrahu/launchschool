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

View templates are separate files that allow us to do some pre-processing on the server side (and intermingle Ruby code with HTML), the Ruby code will be executed and then translated into a String (normally HTML) to be sent back to the client.

### ERB
ERB (Embedded Ruby) is a library and popular template engine for Ruby applications. ERB is a part of the standard library and therefore does NOT need to be downloaded as a Gem from Rubygems.

How to use ERB:
1. `require 'erb'`
2. Create an ERB template object and pass in the string to be translated
3. Invoke the ERB instance method `#result`, which will give us a 100% HTML string

ERB Syntax:
* `<%= %>` evaluates the embedded Ruby code and returns the result in HTML
* `<% %>` evaluates the embedded Ruby code but does NOT return the result in HTML, used for logic, method definitions, etc.

```erb
# example.erb

<% names = ['bob', 'joe', 'kim', 'jill'] %>

<html>
  <body>
    <h4>Hello, my name is <%= names.sample %></h4>
  </body>
</html>
```

### Adding View Templates

View templates are normally stored in a `view` directory, however keep in mind they must be processed before sending them back to the client (unlike static HTML files)

```ruby
# hello_world.rb

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      template = File.read("views/index.erb")
      content = ERB.new(template)
      ['200', {"Content-Type" => "text/html"}, [content.result]]
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

Notice that we create a new ERB template with the `#new` contructor (with the `.erb` file already read into a string variable as an argument). The string (containing the files contents) will be executed by ERB when the `#result` method is called.
