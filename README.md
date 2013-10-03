# R Bindings for the Github v3 API

These are bindings for the Github web service API as of version 3. For
full documentation, please refer to the [Github developer
API](http://developer.github.com/v3).

# Quickie

	> ctx = interactive.login(client.id, client.secret)
    > me = get.myself(ctx)
    > me$public_repos
    [1] 17
    > star.repository(ctx, "cscheid", "guitar")
    > unstar.repository(ctx, "cscheid", "guitar")

# Setting up

In order to use most of their API, Github requires you to register an
[application](https://github.com/settings/applications/). You'll need
to do this if you want to change information, repositories, post
gists, etc. 

## Interactive use

If you will authenticate your Github account interactively (using the
OAuth dance, for example), you should point the Callback URL to
"http://localhost:1410". This is so that `interactive.login` works:
the interactive OAuth login dancing involves redirection to a URL that
is specified in advance. [httr](https://github.com/hadley/httr)
creates a web server on port 1410 to catch the redirection request and
the token that comes with it.

To log in, you will need the Application Client ID and Secret, and you
will call the following function in your R script:

    > ctx = interactive.login(client.id, client.secret, scopes=c("gist"))

This will open a web browser where the caller of the R script
(presumably, you) will be asked to type their Github username and
password. Give more scopes to allow the bindings to do more things ([more
on oAuth scopes](http://developer.github.com/v3/oauth/#scopes)).

## Noninteractive use

If you have obtained an
[OAuth access token](http://developer.github.com/v3/oauth/) by some
other method, you can pass it directly to `create.github.context`. In
fact, `interactive.login` does little else than securing access to a
token interactively, and then calling `create.github.context`.

In other words, you should use `create.github.context` if some other
part of your application is in charge of obtaining the OAuth access
token.

You can also use `create.github.context` to create anonymous access
contexts. You will be able to make some calls into the API, but not
all of them, and you will be much more severely rate-limited. See the
[documentation](http://developer.github.com/v3/#rate-limiting) for details.

## About the Github client secret

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

* Keep track of rate limits
* Honor event API `X-Poll-Interval` query rate limits automatically


