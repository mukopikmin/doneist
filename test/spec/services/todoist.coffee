'use strict'

describe 'Service: todoist', ->

  # load the service's module
  beforeEach module 'doneistApp'

  # instantiate service
  todoist = {}
  beforeEach inject (_todoist_) ->
    todoist = _todoist_

  it 'should do something', ->
    expect(!!todoist).toBe true
