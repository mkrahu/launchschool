### HTTP

#### Describe what HTTP is and the role of the request and the response.

HTTP is most common protocol used to communicate over the internet. Each HTTP transaction is made up of two parts, a request and a response (called a request response cycle). At its simpliest form, an HTTP request outlines an action to be performed, and a HTTP response outlines the result of that action. An HTTP request is initiated by the client (most commonly a web browser) and identifies the resource and action (method) it is requesting. The client then then waits for a response (provided by the server) that indicates whether the request was successful (via a status code) and the requested resource (if applicable).

#### What are the components of an HTTP request and an HTTP response?

 A HTTP request is sent by the client includes a request method (indicating the action needing to be taken), the HTTP version, the resource being requested (a path) and the host (domain name of the server) provider as a header. It may also include other headers providing context about the client and what types of responses it will accept (such as the language, data type, etc.)

A HTTP response includes the HTTP version, a status (the result of the requested action) and it may also provide headers with additional info about the result and a body containing the resulting data (although this is not applicable in some transactions).

#### Identify the components of a URL. Construct a URL that contains a few params and values.

A URL is made up of the protocol, host, and path. It may also include optional items like the port (standardized ports are used when it is not provided), and query parameters.

#### Explain the difference between GET and POST, and know when to choose each.

GET and POST are HTTP methods used within HTTP requests. GET requests store any parameters the URL while POST requests store parameters in the HTTP Request body. GET is used for retrieving resources from the server where no change is needed to the underlying resource being requested, while the POST method is used to initiate an action to change the state of the resource or send data to the server (possibly creating a resource).

#### What is the difference between client-side and server-side code? For each file in a Sinatra project, be able to say which it is.

Client-side and server-side code distinguishes between where the code will be processed. Server-side code is processed by the server prior to the response being sent back to the client. Client-side code is processed by the client itself (normally a browser). Client-side code is generally code that generates the look and feel of an application, while server side code contains the core logic of the application and how it will function, as well how it stores data associated with the application.

### Web

#### How does an HTML form element interact with the server-side code that processes it.

A form element initiates a HTTP request (either GET or POST) to the server, the method and path of the request to be sent is defined within the form, as well as any parameters that we will be sent along with the request. The server associates the HTTP method and path with a route/resource in the application, returning the resource or processing the code associated with the action requested.

#### Why is user-entered content a security risk? Be aware of how to mitigate this risk.

User-entered content is a security risk because the content will probably be executed by your application. If the content has a script embedded within in it, that code will be executed and can allow a malicious user to gain access and/or manipulate data stored in the application.

To ensure this doesn't happen, all user input should be escaped (replacing special characters with html entities) so that it will not be processed as code. Rather than remembering to escape all places where user input is rendered it is often more prudent to escape all dynamic output.


### Sinatra

#### Start a new Sinatra project and write simple routes to handle requests.
Steps to start:
* Create `Gemfile`, add `gem 'sinatra'`
* Create `config.ru` file to configure `Rack`
* Create controller file `app.rb`
* Run `bundle install`
* Run `bundle exec rackup` to start the app

Additional items:
* Add gem `erubis` to `Gemfile` (better performance then eRuby or ERB), also need require `tilt/erubis` on top of controller file, Tilt is an interface to the different types of template engines
* Add gem `sinatra-contrib` for some common extensions including `content_for` and add `require 'sinatra/cotrib'` to controller file
* Add gem `minitest` to Gemfile for testing
* Other misc gems: `bcrypt`, `redcarpet`, `pry`


#### What are the benefits of using view templates? Be able to use an ERB template in a Sinatra route.
View templates can be used to create one file/layout to be used for all instances of a member data or other data that needs to be displayed for many instances.

The specific data being requested can be dynamically populated into the view, then the static HTML is sent to the client.


#### What is the session? Where it is stored? How it is used?

A session is used to simulate stateful web application as a part of the HTTP request response cycle. A session identifier is sent by the server to the client which then stores that info in a Cookie, the client then send the cookie along with future requests. Upon receipt of the request the server validates the session identifier and then uses that information to load any session data associated with the client.

Only the session identifier is generally stored on the client, the remainder of the session data will be stored on the server, although the manner in which it is stored depends on the implementation.


#### Write a view helper and use it within a view template.


#### Explain how redirection works and why it would be needed in a web application.


