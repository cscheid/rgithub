# R Bindings for the Github v3 API

These are bindings for the Github web service API as of version 3. For
full documentation, please refer to the [Github developer
API](http://developer.github.com/v3).

# Setting up

To use this library, you'll need to be a registered Github user. The
current version of the library does not support anonymous requests
(I'm happy to take pull requests that make this work nicely)

## github application

In order to use their API, Github requires you to register an
[application](https://github.com/settings/applications/). You'll need
to do this. When you register it, make sure to point the Callback URL
to "http://localhost:1410". This is so that web.login() works: the
OAuth login dancing involves redirection to a URL that is specified in
advance. [httr](https://github.com/hadley/httr) creates a web server
on port 1410 to catch the redirection request and the token that comes
with it.

## Logging in

To log in, you will need the Application Client ID and Secret, and you
will call the following function in your R script:

    > ctx = web.login(client.id, client.secret)

This will open a web browser where the caller of the R script
(presumably, you) will be asked to type their Github username and
password.

### Remote operation (say, a Rook server asking for user credentials)

COMING SOON. we need to implement the remote OAuth dance differently from
httr.

### About the client secret

 DO NOT PUT THE CLIENT SECRET ON A PUBLICLY VISIBLE LOCATION. This is
equivalent to an application-wide password. It is used by Github to
track API usage, and could be used to impersonate your app. Store it
in a safe location (like a locally-encrypted file in your local
filesystem), ask the user to type it, or pass it via environment
variables from the shell.

# API naming and style

All API entry points are very shallow wrappers around Github's
API. Once you logged in, all calls to the API take the result of
web.login. Examples:

    > repos = get.my.repositories(ctx)
    > repos = get.my.repositories(ctx, type="owned")

The result of all calls to the API is the request from httr. most of
the time you will want the response contents, accessible through httr's
`content()`. This is automatically parsed into JSON, the message
format used throughout's the api:

    > me = get.myself(ctx)
    > content(me)$public_repos
    [1] 17
    
The naming of the function calls is always meant to evoke an
order. It starts with a verb and follows with the appropriate
objects:

    > evts = get.public.events(ctx)
    > result = is.repository.starred.by.me("cscheid", "facet")
    > star.repository(ctx, "cscheid", "guitar")
    > unstar.repository(ctx, "cscheid", "guitar")

When the Github API specifies "inputs", such as with [blob
creation](http://developer.github.com/v3/git/blobs/#create-a-blob),
you will send the JSON content as the last parameter, named `content`:

    > create.blob(ctx, "cscheid", "guitar", list(content="This is a new blob", encoding="utf-8"))

When the Github API specifies extra parameters, such as when [listing repositories](http://developer.github.com/v3/repos/#list-your-repositories), you will pass parameters directly to the API call, like you've already seen above:

    # Get all my repositories, sorted by when I last pushed to them
    > repos = get.my.repositories(ctx, type="owned", sort="pushed")

# TODO

* A lot of the API is still untested. Pull requests are appreciated.
* Keep track of rate limits
* Handle event query rate limits automatically, honor etags infrastructure to save calls
* Handle notification quer rate limits automatically, honor Last-modified infrastructure to save calls
* oAuth scopes
