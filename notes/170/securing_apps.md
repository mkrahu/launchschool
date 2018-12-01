### Securing Applications

#### Sanitizing HTML

XSS Cross-Site Scripting is a common security flaw in web applications where the website is allowing a user to input data that then could be directly served up by the web application during future requests.

The solution is to *escape* content from any untrusted source by replacing certain characters with their HTML entities.

Rack comes with a built-in method for this purpose `Rack::Utils.escape_html`. This can be used to sanitize specific data in the view to ensure that the untrusted content is not processed by the application.

#### A more thorough Approach

Rather than trying to manually sanitize all untrusted outputs, many libraries have switched to the approach of escaping all output. This way a developer doesn't have to remember to escape each part of the application.

To enable this in the Sinatra app:
```ruby
configure do
  set :erb, :escape_html => true
end
```

However you will need to disable auto-escaping in areas where you are using `yield` otherwise the content will be escaped twice... Causing it to render as plain text in the browser. You disable the auto-escape for a section of code by using the `<%==` with two `=` signs.


#### Handling Bad Input

Another security measure is to handle bad inputs gracefully rather than allowing error messages to be rendered back to the client.

Handling the error message and either displaying a default page or redirecting to the home page prevents malicious users from discovering the inner workings of your application through the error message and stack trace.

HTTP Methods and Security

Despite conventional wisdom, `POST` requests are not any more secure than `GET` requests. Although the `POST` request hides the parameters in the body of the HTTP request rather than them being displayed in the URL, any sophisticated user can still obtain this information through pack sniffing.

HTTPS is the only way to properly secure data being sent between the client and the server. The only distinction between `GET` and `POST` requests should be whether the client is requesting something from the server or providing data/updating data on the server.
