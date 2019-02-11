## HTTP

### Describe what HTTP is and the role of the request and the response.

HTTP is the most commonly used protocol for communicating over the internet. HTTP outlines the format for sending request and response messages so that applications (clients and servers) can more easily communicate.

The request details the resource that a client is requesting or the data that is being sent to the server, a request will also include details about the client so that a server knows what type of client it is working with and it's preferences.

The response provides the result of the request. The response will include a status outlining wehther the request was sucessful and also (if applicable) the resource that was being requested. If the request was incorrect the response may send an error message or a message letting the client know the requested resource is at a different location.

### What are the components of an HTTP request and an HTTP response?

A HTTP request is made up of a HTTP method (GET, POST, etc), the path of the resource being requested, and the HTTP version being used in the request. Most of the time the the request will send along additional headers (key value pairs) that provide additional information about the client and what it prefers to receive in response. The request may also include a body with additional parameters needed for the request, or possibly data being sent to the server.

A HTTP response includes a response line(the HTTP version being used, a status code, and a status description), along with optional response headers and response body. The response line outlines the results of the request. The headers generally describe the type of server providing the response, the MIME type and size of the resource being provided, and info about the connection with the server. The body of the HTTP response includes the actual resource that was requested (if applicable).

### Identify the components of a URL. Construct a URL that contains a few params and values.

Protocol/Scheme, Host/Domain, Port (optional), Path, and Query Parameters

### Explain the difference between GET and POST, and know when to choose each.

GET and POST are two HTTP method types. GET is used for requesting resources to be returned from the server, these types of request do not change the state of resources on the server and therefore can be made over and over without consequence. If query parameters are needed in a GET request they are included in the URL of the request.

POST is used for sending data to the server. These types of requests change the state of resources and therefore are dangerous if they are done repeatedly (browsers will issue a warning to the user if they attempt to do so). Query parameters in a POST request are included in the request body, this provides some security for sensitive data as it prevents passwords and the like from being seen in the URL, however message bodies can easily by read by malicious actors and therefore encryption is necessary for real security (via TLS/HTTPS).

### What is the difference between client-side and server-side code? For each file in a Sinatra project, be able to say which it is.

Client-side and server-side refer to where a particular piece of code is executed. Server-side code generally includes the core logic of the application and the storage/retrieval of data from the databased. Client-side code is used for the look and feel of the application including the html, css, and javascript used to render a page in the client's browser.

There are some tricky  however, server templates, for instance, include both server side code for dynamic sections of the page and html for rendering in the browser. These templates are considered server side code because they must first be processed by the server before they are sent to the client.

## Web

### How does an HTML form element interact with the server-side code that processes it.

An HTML form includes two elements (action and method) that are used to identify the path and HTTP method that will be used in the request. The server receives the method and path and maps this to the corresponding server-side code that processes it. The other data included in the form is passed to the server as key value pairs in the URL (for a GET request) or in the HTTP request body (for a POST request). The web server parses this data and passes it to the the server application so it can be used as well.

### Why is user-entered content a security risk? Be aware of how to mitigate this risk.

User-entered data is dangerous because this dynamic content will eventually be processed by the client's browser and/or the server. If the user-entered content includes scripting then when the client/server processes that content it will execute the included script, possibly causing a malicious user to be able to access sensitive data and/or manipulate data stored in the database.

We can prevent this from occuring by 'escaping' special characters and replacing them with the html entity characters corresponding to them. These new html entities will not be recognized by the server/client as code and therefore will be displayed as plain text. The easiest way to handle this is to escape all dynamic content included in the site, this is easier then escaping individual pieces of dynamic content as places can be missed in your application causing an unintended security hole.


