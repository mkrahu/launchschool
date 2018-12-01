### HTTP Request Response Cycle

#### Required components of a HTTP request:

HTTP method, path, and Host header are required. Parameters, all other headers, and message body are optional.

#### Required components of HTTP response:

Status code is required. Headers and body are optional.

#### What determines whether a request should use GET or POST as its HTTP method?

`GET` requests should only retrieve content from the server. They can generally be thought of as "read only" operations, however, there are some subtle exceptions to this rule. For example, consider a webpage that tracks how many times it is viewed. `GET` is still appropriate since the main content of the page doesn't change.

`POST` requests involve changing values that are stored on the server. Most HTML forms that submit their values to the server will use `POST`. Search forms are a noticeable exception to this rule: they often use `GET` since they are not changing any data on the server, only viewing it.
