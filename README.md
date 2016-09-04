# Doneist

[![Build Status](https://travis-ci.org/mukopikmin/doneist.svg?branch=master)](https://travis-ci.org/mukopikmin/doneist)

View completed Todoist tasks.

## Requirement

* Ruby 2.1+
* Todoist Account (Premium or Business)
* Grunt
* Bower

## Build & development

Install build tools via npm.

```
npm install -g grunt-cli bower
```

Build UI components.

```
grunt build
```

Install dependent packages via ruby bundler.

```
bundle Install
```

Set Todoist API token.

```
export TODOIST_TOKEN=xxxxxxxxxxxxxxxxxxx
```

Run server.

```
bundle exec ruby doneist.rb
```

By default this app runs on `http://localhost:4567`.

## Enable Basic auth

If you want to enable basic auth, set environment variables as follows.

```
export BASICAUTH_USER=username
export BASICAUTH_PASSWORD=password
```

## Testing
