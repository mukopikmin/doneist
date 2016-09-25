# Doneist

[![Build Status](https://travis-ci.org/mukopikmin/doneist.svg?branch=master)](https://travis-ci.org/mukopikmin/doneist)
[![Dependency Status](https://gemnasium.com/badges/github.com/mukopikmin/doneist.svg)](https://gemnasium.com/github.com/mukopikmin/doneist)
[![Code Climate](https://codeclimate.com/github/mukopikmin/doneist/badges/gpa.svg)](https://codeclimate.com/github/mukopikmin/doneist)
[![Coverage Status](https://coveralls.io/repos/github/mukopikmin/doneist/badge.svg)](https://coveralls.io/github/mukopikmin/doneist)

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

Install packkages with `bower`.

```
bower install
```

Build UI components.

```
grunt build
```

Install dependent packages via ruby bundler.

```
bundle install
```

Set Todoist API parameters.

```
export TODOIST_CLIENT_ID=xxxxxxxxxxxxxxxxxxx
export TODOIST_CLIENT_SECRET=xxxxxxxxxxxxxxxxxxx
```

Run server.

```
bundle exec ruby doneist.rb
```

By default this app runs on `http://localhost:4567`.


## Testing

```
bundle install
bundle exec rake spec
```
