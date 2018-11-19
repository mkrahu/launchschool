## Working with Sinatra

### Sinatra
Sinatra is a Rack-based web framework. This means it comes with many out of the box features meant to make web development easier.
* Utilized Rack to connect to web servers (like WEBrick)
* Provides conventions for directory structure of application
* Built-in capabilities for routing, view templates, and other features

Keep in mind that at it's core it is only Ruby code connecting to a TCP server, handling requests and sending back respones in HTTP-compliant string format

### How Routes Work
Sinatra provides a DSL (Domain Specific Language) for defining routes, these routes help a developer map a URL pattern to some Ruby code

Routes are created using methods named after the HTTP method to be handled. So, a GET request is handled by a route defined using the get Sinatra method.

```ruby
require "sinatra"
require "sinatra/reloader"

get "/" do
  File.read "public/template.html"
end
```

`sinatra/reloader` causes the application to reload on every request (good for development)
`get "/" do` declares a route that matches the URL `"/"`. This code (the block) will be run every time a client request the root directory

Static documents in the `./public` directory can also be loaded directly (no route required)

### Rendering Templates

Currently the application is working as a static file servers as there is no dynamic content. Templates (or view templates) are files containing text that is coverted to HTML (normally) before being sent back to the client.

There are many *templating languages*, they all provide different way to generate HTML and embed dynamic values in that response. This process is called *rendering*.

ERB (Embedded Ruby) is a popular templating language (default in Ruby on Rails). Keep in mind that ERB has it's own distinct API but Sinatra utilizes Tilt, which creates a uniform API between many supported templating languages.

Templates live in the `views` directory. When a view is referenced by it's symbol Sinatra will load the corresponding view in the `views` directory.

```ruby
get "/" do
  erb :home # loads the home.erb file from the view directory
end
```

```ruby
get "/" do
  haml :home # loads the home.haml file from the view directory
end
```

### Passing variables into Views

Keep in mind that instance variables, not local variables, must be used to pass values into the view template

```ruby
get "/" do
  @title = "Hello world!" # Available in the view
  body = "This won't work..." # Not available
end
```

### Using Layouts

Layouts are like view tempalates but they wrap around the other view templates (or other view templates are embedded in them). Layouts are used to provide shared HTML that is used by all views, and often include links to stylesheets and JavaScript files

.

`layout.erb` is the default layout in Sinatra, if that file exists it will be utilized as a layout for all other views.

A `yield` keyword is used within the layout to bring in the content from the specific view being requested. Keep in mind that a layout can still have dynamic content, such as `<%= @title %> that can then be populated with different data depending on the specific route/view being served.

You can explicitly use a specific layout with a view as well in Sinatra:

```ruby
get "/" do
  erb :home, layout: :custom_layout # loads custom_layout.erb as layout
end
```

### Route paramaters

Routing parameters allow the specific routes you write in Sinatra to be more flexible with what they can handle. For instance, if we have a `"/chapter/1"` route for Chapter 1, and we want to be able to handle multiple chapters (maybe even a number of chapters that we're unsure of or could change), then rather then make multiple routes `"/chapter/1"`, `"/chapter/2"`, etc. we create a Route Parameter:

Routes can specify parameters by using colon followed by the parameter `name: /chapters/:number`. In this case, the value would be accessible within the route using `params[:number]`.

```ruby
get "/chapter/:number" do |number|
  @chapter = get_chapter(number)

  erb :chapter
end
```

The above example will handle a chapter with any number ( however we would want to add some check to ensure a chapter of that number existed in our data). But notice how the amount of code needed to handle all chapters is not much more than we'd need to create to handle a single chapter.

### Before filters

Another way to remove duplicate code from a Sinatra application is to utilize the `before` filter. If we have code that needs to be run before any (or at least most) views will be rendered then it is a great place for the `before` filter.

```ruby
before do
  @contents = File.read('contents.txt')
end

get "/" do
  erb :home
end

get "/chapter/:number" do |number|
  @chapter = @contents[number]
end
```

The `before` filter is run before the matching route is handled and therefore the `@contents` instance variable with the loaded file will also be available in route.

Instance variables that are used in the layout are often good candidates for the `before` filter, however if the value changes depending on the route then that may not be the case. There are also values used in many views that could also be a good candidate.

### View Helpers

View helpers are methods that are made available in templates by Sinatra for the purpose of filtering data, processing data, or performing some other functionality. They are defined under the `helper` method.

```ruby
 def slugify(text)
    text.downcase.gsub(/\s+/, "-").gsub(/[^\w-]/, "")
end
```

View helpers are helpful for removing duplicate code within view templates and also removing as much server side code from the view templates as possible.

### Redirecting

#### Redirect

A user can be sent to a new location in response to a request with redirection. This is done in Sinatra using the `redirect` method.

The redirection is accomplished by setting the `Location` header in the response. The client looks at the URL in the location header and sends out a new HTTP GET request for the associated resource, which in turn navigates the client to that new location.

```ruby
get "/chapter/bad" do
  redirect "/a/good/path"
end
```

It is common to redirect a user as the result of creating or updating some data, such as when a web site redirects a user to an order confirmation page after a payment form is successfully submitted.

Redirects can also be used to cover edge cases within an existing route. For instance in our chapters example if the client requests a chapter number that does not exist, we can redirect gracefully to the table of contents.

```ruby
get "/chapter/:number" do |number|
  redirect "/" unless valid_chapters.cover? number
end
```
#### Not Found

Sinatra also provides a route that will handle cases where the file/path is not found. By default the `not_found` method will return a `404 Not Found` response to the client, but we can also handle it more gracefully by redirecting if that is desired.

```ruby
not_found do
  'Not found'
end
```

```ruby
not_found do
  redirect "/"
end
```

### Parameters

We have used parameters extracted from the URL with route parameters, but the other two other ways we can communicate parameters via the `params` hash.

1. Using query parameters in the URL
2. By submitting a form using a POST request

Query parameters are entered into the `params` hash as key value pairs at the end of the URL, params from a POST request are taken from the `name` and `value` elements in a form (if it's method is POST).

These parameters are accessed in Sinatra methods via the `params` hash in the same way as route parameters.

### Client vs. Server side code

It is important to keep in mind where a piece of code will be processed, either on the client-side or server-side, as this has implications on what data/variables may be available and what types of processes can be performed.

Gemfiles, `.erb` files, `.rb` files are all examples of files on the server-side

Javascript files (`.js`) and CSS (`.css`) files, however are examples of client-side files.
