### Making the Todo Application

#### What is State?

State is data that persists over time.

When someone says that HTTP is state-less, what they mean is that every HTTP request is handled separately. When a server finishes handling one request, it forgets everything about that request before accepting the next one.

Need to build state with techniques built on top of HTTP. Just like grammar only define usage but not meaning, HTTP defined the protocol but not state.

#### Implications of statelessness - Error messages

On a successful request we will redirect the users to another page, however if there is an error we will generally render the page again. The difference in using a redirect vs. rendering a template has implications on statelessness.

If we redirected a user we will lose any instance variables or data that was attached to the previous request, making it more difficult to provide detailed error messages and providing recompleting other fields that did not contain errors. Rendering a template directly allows us to pass that context to the template so it can be used when re-rendering the view.

#### When to use validations

All user inputs should be validated. If an error in the input is found, then you should re-render the form and display an error message outlining the error.

You should NOT use validations to catch bugs in your code.

Make sure that error messages will make sense to the user, do not write error messages that involve the context of our application (such as index not found), only provide the user with feedback about what they requested (if they were expecting a list, then list not found would be appropriate).

Displaying errors with internal context of our application can also be use by malicious users by providing them details of your applications implementation. This is another reason error messages should be relatively generic and only reply to the users expectations and what needs to be corrected.

#### Delete actions

Delete actions (or any action that is unsafe to do repeatedly) should be sent as a POST request via a form. Cannot send a DELETE request via a form (at least not as of HTML5)

Should prompt the user before a delete action is taken, but this requires some Javascript

