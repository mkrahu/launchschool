### Handling a Request Manually

#### Creating an Echo Server

We can create our own echo server that simply sends back the original request back to the client by utilizing a TCP Server (`require 'socket'`). We create a new instance of TCP server and then have a 'listen' for new requests coming in at the specified host (localhost) and port (often 3000).

#### Parsing Path and Parameters

In order to process a HTTP request. We must parse out the HTTP Method, path & parameters, and HTTP version in order to know the resource a request was accepting.

Most of this functionality is implemented by the web server and application server by default (along with additional information functionality provided by the framework you may be using. They will then send the HTTP request type, the requested path, and any parameters and headers sent with the request to the application itself.

Example: https://amazon.com/Double-Stainless-Commercial-Refrigerator/B60HON32?ie=UTF8&qid=142952676&sr=93&keywords=commercial+fridge

* host: amazon.com
* query parameter names: ie, qid, sr, keywords
* protocol: https
* port: 443 (the default for HTTPS)

#### Sending a Complete response

An HTTP response should include the status code, optional headers that provide additional information about the response (i.e. Content-Type) and the body (with the contents of the response).


#### Summary

Although it is not something you'd normally do, it is possible to interact with HTTP manually because it is a text-based protocol.

HTTP is built on top of TCP, which is a networking layer that handles communicating between two computers.

URLs are made up of many components: a protocol, a host, a port, a path, and parameters.

Query parameters are parameters that are included in a URL. They are appended to the path using ?. Parameters are specified in the URL using the form key=value.

Parameters after the first are appended to the URL using &.

HTTP is stateless, which means that each request is handled separately by the server. By carefully crafting URLs and parameters, stateful interactions can be built on top of HTTP. This can also be done through session either by storing data in the client through cookies or within a data store on the server side.

