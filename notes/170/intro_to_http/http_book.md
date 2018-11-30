## HTTP Book

### HTTP - Hypertext Transfer Protocol

Serves as the link between applications and the transfer of hypertext documents.

HTTP is a response/request protocol where a client makes a request to a server and
waits for a response. The request and response follow a format (a protocol) which
both matchines understand (this is HTTP).

Currently HTTP 1.1 is most commonly used, however HTTP 2.0 is under development.

#### How the Internet Works

The internet consists of millions of interconnected networks that allow computers
and devices to communicate.

#### Internet Protocol

Each network is given an IP Address (short for Internet Protocol Address) which
is used like a street address to deliver HTTP requests to and from a network or
machine.

The ISP (Internet Service Provider) provides public IPs. In addition to the IP
address, a port number is also necessary for communication. Specific ports
are used for certain types of communication by convention, for instance:
* 80: HTTP
* 443: HTTPS
* 25: Email (SMTP)
* 53: DNS

#### DNS

DNS (Domain Name System) is a mapping from the URLs we use everyday (www.google.com)
to the IP addresses of the underlying servers hosting that website.

DNS is a distributed database so no single DNS server has the entire database. If
a DNS server does not have the requested URL, it will route the request up the
heirarchy until it is found.

##### Clients and Servers

A client is any machine making a request, the most common client people use is
a web browser.

A server is a machine that stores the info you are requesting and it is simply
any machine that is capable of handling an inbound request.

#### Statelessness

HTTP is a stateless protocol, meaning each request/response cycle is completely
separate from the previous one. This means the server does not have to hang on
to info inbetween requests. This also avoids any cleanup if there is an issue
with the request breaking in route to the server (TCP technically handles some
of the clean-up, sending another HTTP request if all of the info requested
was not received).

Web developers must work around HTTP's statelessness in order to create state
in their applications, this can sometime make a developers life complicated and
causes some issues when trying to secure information sent over the web.

### What is a URL

A URL (Uniform Resource Locator) is the address you type into your browser and
is the most common example of a generic concept called a Uniform Resource
Identifier.

#### URL Components

What are the different parts of: http://www.example.com:88/home?item=book

* `http`: The *scheme*: tells the client how to request the resource.
* `www.example.com`: The *host*: Tell the client where the resource is located.
* `:88`: The *port*: Required only if you are not using the standard port
          for the scheme.
* `\home`: The *path*: The location of the local resource being requested.
* `?item=book`: The *query string*: Made up of *query parameters* which are
          key value pairs

#### Query Strings and Parameters

The start of a query string is marked by the special character `?` in the URL.

Following the `?` will be one or many key value pairs, separate by the `=` symbol.

Query strings are passed through the URL and therefore are only used in GET requests.
Post requests also have the ability to send data in key / value pairs but this
data is sent through the HTTP body instead.

#### URL Encoding

Some characters (such as `?` and `=`) have special meaning in the URL and therefore
need to be encoded if they are included in the URL when not for their specific
purpose, when this is needed the ASCII code of the character is sent instead.


#### Sending Requests

GET requests are used for retrieving a resource.

POST requests are used for sending data to the server or initiate an action.

Typically you use GET requests when submitting a URL and POST requests when submitting
a form. However there are exceptions, for instance you may use a GET request in
a form when you are implementing a search form.

GET requests send the data in key value pairs within the URL, however POST requests
send the data in the HTTP message *body*.

#### HTTP Headers

HTTP header allow additional context to be sent along with an HTTP request (beyond
the HTTP method and path)

This will include the *Domain* of the server... This context is needed now that
many website are hosted on the same server.

Accepted languages are also included along with the User Agent (type of computer
and browser being used).

### HTTP Responses

#### Status Code

The first component of an HTTP Response. Signifies the result of the request:

* 200 `OK`  The request was handled successfully.
* 302 `Found` The requested resource has changed temporarily. Usually results in a redirect to another URL.
* 404 `Not Found` The requested resource cannot be found.
* 500 `Internal Server Error` The server has encounter a generic error.

A `Location` header is included for requests meant to redirect the client to a new URL.

#### Response Headers

Response headers are used to provide context for the response being sent back. It can include:

* Content-Encoding  The type of encoding used on the data.
* Server  Name of the server.
* Location  Notify client of new resource location.
* Content-Type  The type of data the response contains.

### Stateful Web Apps

HTTP is a stateless protocol but we still are able to use tools to create a stateful experience

Common tools to create stateful apps are:
* Sessions
* Cookies
* AJAX (Asynchronous JavaScript and XML)

#### Sessions

Sessions are created by a server sending a unique token to the client that will be sent along
with future HTTP requests. This token is known as a *session identifier*.

To utilize the sessions, a server must do a few things when a request is received:
1. Check if the request as a session identifier
2. If the identifier exists, the server checks that it is still valid
3. The server must retrieve the session data based on the session id
4. The server recreates the app data based on the session data before sending a response

Sessions must also be managed so that they can be deleted at logoff and expire if necessary, lots
of optimizations have been created for sessions but there are also many security concerns.

#### Cookies

A cookie is a piece of data that's sent from the server and stored on the client during a
request/response cycle. Cookies are small files that stored in the browser that contain
session info.

The *set-cookie* header is sent along with the request from the server to first set the
cookie and it's value. The browser will store this data and send the *cookie* header
with the data contained in the cookie along with future HTTP requests.

**** AJAX

AJAX allows the client to send requests and recieve responses without requiring a full
page refresh. This saves computational bandwidth on the server and also makes websites
respond faster and more responsive.

Google's instance results is probably the most famous version of AJAX, with each key
stroke an additional request is sent to the server updating the results returned, however
the rest of the page is not required to refresh.

### Security

#### HTTPS (Secure HTTP)

HTTP requests and responses are being sent back and forth as strings. If a macilious hacker
intercepts these requests and responses (via a packet sniffer), they can easily view all of
the data being sent in the message (including the session id) and this would allow the hacker
to commit *session hijacking* and impersonate you on the website.

HTTPS encrypts each request and response so that even if the requests/responses are
intercepted, the information is useless as it's unreadable.

HTTPS send messages through a cryptographic tool called *TLS*. Early versions of HTTPS used
SSL (Secure Socket Layer).

#### Same-Origin Policy

The same-origin policy is an important concept that allows resources from the same origin
to access each other freely, but prevents access to resources on other sites. An *origin*
is the made up protocol, hostname, and port.

For example, an HTML document (http://www.example.com) can embedded a Javascript file from
(http://www.example.com/hello.js) because they share the same origin, but it could not
embed a Javascript file from http://www.test.com.

CORS (Cross-origin resource sharing) was developed as an exception to this rule in cases
where it is needed, bypassing the same-origin policy. This is accomplished by including
additional headers.

Cross-origin is a cornerstone of web security.

#### Session Hijacking

When a Session ID is obtained by a hacker they can perform session-hijacking. Sending a
request to the server and including the session ID to authenticate with the website
as the person the Session ID was stolen from.

Countermeasures for session hijacking:
* Session IDs are reset with each successful login. By doing this many websites also
make you re-authenticate when entering a sensitive area (such as billing info or
when deleting an account)
* Session expiration: Session IDs can be set to expire after a given period of time. Without
a expiration the hacker would have a infinite amount of time to pose as the user.
* HTTPS: Encryption assist with preventing the users Session ID from being stolen in
the first place.

#### Cross-Site Scripting (XSS)

XSS is when you allow users to input HTML or Javascript that is then display by the site.

To prevent this, user inputs should be *escaped*, replacing the HTML characters with a
combination of ASCII characters (called HTML entities) so that the code is not processed
by the browser. You can also use a safer format such as Markdown when input needs to be
formatted but using HTML and Javascript directly presents a security risk.




