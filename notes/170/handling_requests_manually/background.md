### Client-Server Background

#### Server Components

When we think about the HTTP request/response cycle we think of communication between a client and server, however server is a very over-loaded term in this context.

A server can be made up of multiple machines with different roles. Common ones are:
* Web Server
* Application Server
* Data Store

Each of these has separate functions, and each one can actually be made up of multiple machines.

A *web server* is typically a server that responds to static assets: files, images, css, javascript, etc. these requests don't require any data processing, so can be handled by a simple web server.

An *application server*, on the other hand, is typically where application or business logic resides, and is where more complicated requests are handled. This is where your server-side code lives when deployed.

The application server will often consult a persistent data store, like a relational database, to retrieve or create data. Data stores can also be simple files, key/value stores, document stores and many other variations, as long as it can save data in some format for later retrieval and processing.

There are other possible components such as load-balancers, etc. but these are less important for our roles as web developers.

#### HTTP over TCP/IP

HTTP requests normally rely on a TCP/IP connections.

There are many different layers at work when connecting a client to a server, each of these layers uses its own protocols in order to coordinate the request.

HTTP is what's known as the *Application Layer Protocol*. TCP/IP is more complicated as it represents the lower layers in the communication stack made up by the OSI (Open Systems Interconnection) model that is critical to making the internet work.

In summary, HTTP is along the lines of a convention and only operates at the application layer, while the OSI model specifies communication rules among systems on the internet across all layers. HTTP uses TCP/IP under the hood as the transport and network layers; it's actually TCP/IP that's doing all the heavy lifting and ensuring that the request/response cycle gets completed between your browser and the server.

#### Application Server

The application server is generally the only infrastructure needed when working in development. Only when we get ready to deploy our application in a production environment does the other infrastructure come into play.


